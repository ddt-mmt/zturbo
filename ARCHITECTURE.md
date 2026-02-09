# ZTURBO Architecture Blueprint

## 1. High-Level Overview

ZTURBO is designed as a modular shell-based application that leverages native Linux tools (`rsync`, `fpsync`, `du`, `find`) to perform high-performance data transfers. It separates the "Transfer Logic" from the "Monitoring Logic" to ensure stability and responsiveness.

```mermaid
graph TD
    User([User]) -->|Interact| ZTURBO[ZTURBO CLI]
    User -->|Monitor| ZMTURBO[ZMTURBO Monitor]
    
    subgraph Core Engine
        ZTURBO -->|Config| ModeSelect{Select Mode}
        ModeSelect -->|Safe Mode| Sequential[Sequential Rsync]
        ModeSelect -->|Turbo Mode| Hybrid[Hybrid Parallel Engine]
        
        Sequential -->|Exec| TransferProcess[Transfer Process]
        Hybrid -->|Exec| BackgroundJobs[Background Jobs & Fpsync]
    end
    
    subgraph Data Flow
        TransferProcess -->|Write| DestStorage[(Destination Storage)]
        BackgroundJobs -->|Write| DestStorage
    end
    
    subgraph Monitoring System
        TransferProcess -->|Status| DashboardFile[Dashboard .info File]
        BackgroundJobs -->|Status| DashboardFile
        ZMTURBO -->|Read| DashboardFile
        ZMTURBO -->|Display| TUI[Terminal UI]
    end
```

## 2. Transfer Execution Flow (Main Logic)

The core logic of `zturbo` handles user input, path selection, and mode switching before initiating the actual data movement.

```mermaid
sequenceDiagram
    participant User
    participant Menu as Menu System
    participant Calc as Size Calculator
    participant Engine as Transfer Engine
    participant Log as Report Generator

    User->>Menu: Select Source Paths
    User->>Menu: Select Destination Path
    Menu->>Calc: Background Size Calculation
    Calc-->>Menu: Return Total Size & File Count
    
    User->>Menu: Select Mode (SAFE/TURBO)
    User->>Menu: Confirm (Type 'OK')
    
    Note over Menu, Engine: Critical Handover
    
    Menu->>Engine: Initialize Transfer
    Engine->>Log: Create Start Report
    
    alt SAFE MODE
        Engine->>Engine: Run Single Rsync (Blocking)
    else TURBO MODE
        loop For Each Source
            alt Is Directory
                Engine->>Engine: Run Fpsync (Parallel Threads)
            else Is File
                Engine->>Engine: Run Rsync Background Job (&)
            end
        end
        Engine->>Engine: Wait for All PIDs
    end
    
    Engine->>Log: Write Completion Report
    Engine-->>User: Show Success/Failure
```

## 3. Directory Structure & Components

```mermaid
classDiagram
    class ZTURBO_Package {
        +install.sh
        +README.md
    }
    
    class Binaries {
        +zturbo (Main Script)
        +zmturbo (Monitor)
    }
    
    class TempFiles {
        +/tmp/zturbo_dashboard/*.info
        +/tmp/zturbo_reports/*.txt
    }
    
    ZTURBO_Package *-- Binaries
    Binaries --> TempFiles : Creates/Reads
```
