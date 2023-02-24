part of AureusTestingApp;

class SafetyList {
  var metadata = Safety.detailMetaData;

  List<SafetyOptionDetails> metadataArray() {
    return [
      metadata.deviceSandboxDetails(),
      metadata.disableBiometricsDetails(),
      metadata.disableNotificationsDetails(),
      metadata.disableScreenshotsDetails(),
      metadata.enable2FADetails(),
      metadata.exitBarDetails(),
      metadata.failedPasscodeDataDeletionDetails(),
      metadata.localDataStorageDetails(),
      metadata.logFailedAttemptsDetails(),
      metadata.onlyNeccessaryEmailsDetails(),
    ];
  }

  List<Widget> safetyCards() {
    return [];
  }
}
