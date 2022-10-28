enum MainEndpoint {
  fetchTopHeadlines("/v2/top-headlines");

  final String value;
  const MainEndpoint(this.value);
}
