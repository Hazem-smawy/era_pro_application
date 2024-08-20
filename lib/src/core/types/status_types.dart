enum Status { LOADING, SUCCESS, ERROR, NOTHING }

extension StatusExtension on Status {
  Status changeTo(Status newStatus) {
    return newStatus;
  }

  bool isLoading() => this == Status.LOADING;
  bool isSuccess() => this == Status.SUCCESS;
  bool isError() => this == Status.ERROR;
  bool isNothing() => this == Status.NOTHING;
}
