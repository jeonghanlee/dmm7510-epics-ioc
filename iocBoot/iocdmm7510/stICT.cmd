< envPaths
< DMM7510.config
< ICT.config

####################################################

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/dmm7510App/Db")

## Register all support components
dbLoadDatabase ("${TOP}/dbd/dmm7510.dbd")
dmm7510_registerRecordDeviceDriver pdbbase

asSetFilename("$(TOP)/dmm7510App/Db/accessSecurityFile.acf")

drvAsynIPPortConfigure("${PORT}", "${IPADDR}:${IPPORT} TCP",0,0,0)

## Load record instances
dbLoadRecords("${TOP}/db/dmm7510.db", "P=${P}, R=${RDMM}, PORT=${PORT}")
dbLoadRecords("${TOP}/db/ict.db", "P=${P}, R=${R}, Instrument=${P}${RDMM}")

< save_restore.cmd

## Run this to trace the stages of iocInit
#traceIocInit

iocInit

## Start any sequence programs

# Sequencer STATE MACHINES Initialization

# No sequencer program

# Create manual trigger for Autosave
create_triggered_set("auto_settings_ict.req", "${P}${R}SaveTrg", "P=${P}, R=${R}")

