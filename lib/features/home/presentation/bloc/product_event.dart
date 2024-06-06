abstract class ProductEvent {
  const ProductEvent();
}

class GetProducts extends ProductEvent {
  const GetProducts();
}

class UpdateFilterCriteria extends ProductEvent {
  final FilterCriteria criteria;

  const UpdateFilterCriteria(this.criteria);
}

enum FilterCriteria { newest, oldest, priceLow, priceHigh, bestSelling }