#===========
#run_model.R
#===========

#This script demonstrates the VisionEval framework for a demonstration RPAT Module

#Load libraries
#--------------
library(visioneval)

#Initialize model
#----------------
initializeModel(
  ModelScriptFile = "run_model.R",
  ParamDir = "defs",
  RunParamFile = "run_parameters.json",
  GeoFile = "geo.csv",
  ModelParamFile = "model_parameters.json",
  LoadDatastore = FALSE,
  DatastoreName = NULL,
  SaveDatastore = TRUE
  )

#Run all demo module for all years
#---------------------------------
Year <- getYears()[1]
for(Year in getYears()) {
  runModule(
    ModuleName = "CreateHouseholds",
    PackageName = "VESimHouseholds",
    RunFor = "BaseYear",
    RunYear = Year
  )
  runModule(
    ModuleName = "PredictWorkers",
    PackageName = "VESimHouseholds",
    RunFor = "BaseYear",
    RunYear = Year
  )
  runModule(
    ModuleName = "PredictIncome",
    PackageName = "VESimHouseholds",
    RunFor = "BaseYear",
    RunYear = Year
  )
   runModule(
    ModuleName = "CreateBaseSyntheticFirms",
    PackageName = "VESyntheticFirms",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateBasePlaceTypes",
    PackageName = "VELandUse",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CreateBaseAccessibility",
    PackageName = "VETransportSupply",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "AssignVehicleFeatures",
    PackageName = "VEHouseholdVehicles",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateTravelDemand",
    PackageName = "VEHouseholdTravel",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateCongestionBase",
    PackageName = "VETransportSupplyUse",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CreateFutureAccessibility",
    PackageName = "VETransportSupply",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "AssignVehicleFeaturesFuture",
    PackageName = "VEHouseholdVehicles",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateTravelDemandFuture",
    PackageName = "VEHouseholdTravel",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateInducedDemand",
    PackageName = "VEHouseholdTravel",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateCongestionFuture",
    PackageName = "VETransportSupplyUse",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculatePolicyVmt",
    PackageName = "VEHouseholdTravel",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "CalculateCongestionPolicy",
    PackageName = "VETransportSupplyUse",
    RunFor = "BaseYear",
    RunYear = Year)
  runModule(
    ModuleName = "ReportRPATMetrics",
    PackageName = "VEReports",
    RunFor = "BaseYear",
    RunYear = Year)
}

