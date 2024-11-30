class PagedResponse<T> {
  final int? total;
  final int? page;
  final int? size;
  final int? pages;
  final List<T> data;

  PagedResponse({required this.total, required this.page, required this.size, required this.pages, required this.data});
}