class NavDrawerState {
  final NavItem selectedItem;
  const NavDrawerState(this.selectedItem);
}

// helpful navigation pages, you can change
// them to support your pages
enum NavItem {
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six,
}
