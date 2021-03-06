context("createMonitorISArtifacts.R")

test_that("parseLogs.studies output", {
  logs.study <- readRDS("datasets/parseLogsToUIStudyViews.rds")
  res <- ImmuneSpaceCron:::parseLogs.study(logs.study)
  expect_true(all.equal(colnames(res), c("study", "date2", "count")))
  types <- unname(sapply(res, typeof))
  expect_true(all.equal(types, c("character", "double", "integer")))
  expect_true(length(unique(res$study)) == 13)
  expect_true(min(res$count) > 0)
})


test_that("parseLogs.modules output", {
  logs <- readRDS("datasets/parsedLogFileOutput.rds")
  res <- ImmuneSpaceCron:::parseLogs.modules(logs, searchStrings$modules)
  expect_true(all.equal(colnames(res), c("module", "date2", "count")))
  types <- unname(sapply(res, typeof))
  expect_true(all.equal(types, c("character", "double", "integer")))
  expect_true(length(unique(res$module)) == 1)
  expect_true(min(res$count) > 0)
})

test_that("parseLogs.reports output", {
  logs <- readRDS("datasets/parsedLogFileOutput.rds")
  res <- ImmuneSpaceCron:::parseLogs.reports(logs, searchStrings$reports)
  expect_true(all.equal(colnames(res), c("report", "date2", "count")))
  types <- unname(sapply(res, typeof))
  expect_true(all.equal(types, c("character", "double", "integer")))
  expect_true(length(unique(res$report)) == 2)
  expect_true(min(res$count) > 0)
})

test_that("parseLogs.rstudio output", {
  logs <- readRDS("datasets/parsedLogFileOutput.rds")
  res <- ImmuneSpaceCron:::parseLogs.rstudio(logs, searchStrings$rstudio)
  expect_true(all.equal(colnames(res), c("Date", "Sessions")))
  types <- unname(sapply(res, typeof))
  expect_true(all.equal(types, c("double", "integer")))
  expect_true(length(unique(res$Date)) == 2)
  expect_true(min(res$Sessions) > 0)
})
