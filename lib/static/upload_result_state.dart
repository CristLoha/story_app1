sealed class UploadResultState {}

class UploadNoneState extends UploadResultState {}

class UploadLoadingState extends UploadResultState {}

class UploadErrorState extends UploadResultState {
  final String message;
  UploadErrorState(this.message);
}

class UploadSuccessState extends UploadResultState {}
