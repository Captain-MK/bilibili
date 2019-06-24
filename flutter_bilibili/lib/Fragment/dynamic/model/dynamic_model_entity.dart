class DynamicModelEntity {
	List<DynamicModelBannerlist> bannerList;
	List<DynamicModelSubnavlist> subNavList;
	List<DynamicModelLocalnavlist> localNavList;
	DynamicModelSalesbox salesBox;
	DynamicModelConfig config;
	DynamicModelGridnav gridNav;

	DynamicModelEntity({this.bannerList, this.subNavList, this.localNavList, this.salesBox, this.config, this.gridNav});

	DynamicModelEntity.fromJson(Map<String, dynamic> json) {
		if (json['bannerList'] != null) {
			bannerList = new List<DynamicModelBannerlist>();(json['bannerList'] as List).forEach((v) { bannerList.add(new DynamicModelBannerlist.fromJson(v)); });
		}
		if (json['subNavList'] != null) {
			subNavList = new List<DynamicModelSubnavlist>();(json['subNavList'] as List).forEach((v) { subNavList.add(new DynamicModelSubnavlist.fromJson(v)); });
		}
		if (json['localNavList'] != null) {
			localNavList = new List<DynamicModelLocalnavlist>();(json['localNavList'] as List).forEach((v) { localNavList.add(new DynamicModelLocalnavlist.fromJson(v)); });
		}
		salesBox = json['salesBox'] != null ? new DynamicModelSalesbox.fromJson(json['salesBox']) : null;
		config = json['config'] != null ? new DynamicModelConfig.fromJson(json['config']) : null;
		gridNav = json['gridNav'] != null ? new DynamicModelGridnav.fromJson(json['gridNav']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.bannerList != null) {
      data['bannerList'] =  this.bannerList.map((v) => v.toJson()).toList();
    }
		if (this.subNavList != null) {
      data['subNavList'] =  this.subNavList.map((v) => v.toJson()).toList();
    }
		if (this.localNavList != null) {
      data['localNavList'] =  this.localNavList.map((v) => v.toJson()).toList();
    }
		if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
		if (this.config != null) {
      data['config'] = this.config.toJson();
    }
		if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
		return data;
	}
}

class DynamicModelBannerlist {
	String icon;
	String url;

	DynamicModelBannerlist({this.icon, this.url});

	DynamicModelBannerlist.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelSubnavlist {
	String icon;
	String title;
	String url;
	bool hideAppBar;

	DynamicModelSubnavlist({this.icon, this.title, this.url, this.hideAppBar});

	DynamicModelSubnavlist.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelLocalnavlist {
	String statusBarColor;
	String icon;
	String title;
	String url;
	bool hideAppBar;

	DynamicModelLocalnavlist({this.statusBarColor, this.icon, this.title, this.url, this.hideAppBar});

	DynamicModelLocalnavlist.fromJson(Map<String, dynamic> json) {
		statusBarColor = json['statusBarColor'];
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['statusBarColor'] = this.statusBarColor;
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelSalesbox {
	DynamicModelSalesboxBigcard2 bigCard2;
	DynamicModelSalesboxSmallcard4 smallCard4;
	DynamicModelSalesboxSmallcard3 smallCard3;
	DynamicModelSalesboxBigcard1 bigCard1;
	DynamicModelSalesboxSmallcard2 smallCard2;
	DynamicModelSalesboxSmallcard1 smallCard1;
	String icon;
	String moreUrl;

	DynamicModelSalesbox({this.bigCard2, this.smallCard4, this.smallCard3, this.bigCard1, this.smallCard2, this.smallCard1, this.icon, this.moreUrl});

	DynamicModelSalesbox.fromJson(Map<String, dynamic> json) {
		bigCard2 = json['bigCard2'] != null ? new DynamicModelSalesboxBigcard2.fromJson(json['bigCard2']) : null;
		smallCard4 = json['smallCard4'] != null ? new DynamicModelSalesboxSmallcard4.fromJson(json['smallCard4']) : null;
		smallCard3 = json['smallCard3'] != null ? new DynamicModelSalesboxSmallcard3.fromJson(json['smallCard3']) : null;
		bigCard1 = json['bigCard1'] != null ? new DynamicModelSalesboxBigcard1.fromJson(json['bigCard1']) : null;
		smallCard2 = json['smallCard2'] != null ? new DynamicModelSalesboxSmallcard2.fromJson(json['smallCard2']) : null;
		smallCard1 = json['smallCard1'] != null ? new DynamicModelSalesboxSmallcard1.fromJson(json['smallCard1']) : null;
		icon = json['icon'];
		moreUrl = json['moreUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }
		if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
		if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }
		if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }
		if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }
		if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }
		data['icon'] = this.icon;
		data['moreUrl'] = this.moreUrl;
		return data;
	}
}

class DynamicModelSalesboxBigcard2 {
	String icon;
	String title;
	String url;

	DynamicModelSalesboxBigcard2({this.icon, this.title, this.url});

	DynamicModelSalesboxBigcard2.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelSalesboxSmallcard4 {
	String icon;
	String title;
	String url;

	DynamicModelSalesboxSmallcard4({this.icon, this.title, this.url});

	DynamicModelSalesboxSmallcard4.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelSalesboxSmallcard3 {
	String icon;
	String title;
	String url;

	DynamicModelSalesboxSmallcard3({this.icon, this.title, this.url});

	DynamicModelSalesboxSmallcard3.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelSalesboxBigcard1 {
	String icon;
	String title;
	String url;

	DynamicModelSalesboxBigcard1({this.icon, this.title, this.url});

	DynamicModelSalesboxBigcard1.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelSalesboxSmallcard2 {
	String icon;
	String title;
	String url;

	DynamicModelSalesboxSmallcard2({this.icon, this.title, this.url});

	DynamicModelSalesboxSmallcard2.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelSalesboxSmallcard1 {
	String icon;
	String title;
	String url;

	DynamicModelSalesboxSmallcard1({this.icon, this.title, this.url});

	DynamicModelSalesboxSmallcard1.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelConfig {
	String searchUrl;

	DynamicModelConfig({this.searchUrl});

	DynamicModelConfig.fromJson(Map<String, dynamic> json) {
		searchUrl = json['searchUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['searchUrl'] = this.searchUrl;
		return data;
	}
}

class DynamicModelGridnav {
	DynamicModelGridnavFlight flight;
	DynamicModelGridnavHotel hotel;
	DynamicModelGridnavTravel travel;

	DynamicModelGridnav({this.flight, this.hotel, this.travel});

	DynamicModelGridnav.fromJson(Map<String, dynamic> json) {
		flight = json['flight'] != null ? new DynamicModelGridnavFlight.fromJson(json['flight']) : null;
		hotel = json['hotel'] != null ? new DynamicModelGridnavHotel.fromJson(json['hotel']) : null;
		travel = json['travel'] != null ? new DynamicModelGridnavTravel.fromJson(json['travel']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.flight != null) {
      data['flight'] = this.flight.toJson();
    }
		if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
		if (this.travel != null) {
      data['travel'] = this.travel.toJson();
    }
		return data;
	}
}

class DynamicModelGridnavFlight {
	DynamicModelGridnavFlightItem2 item2;
	DynamicModelGridnavFlightItem1 item1;
	String endColor;
	DynamicModelGridnavFlightMainitem mainItem;
	DynamicModelGridnavFlightItem4 item4;
	DynamicModelGridnavFlightItem3 item3;
	String startColor;

	DynamicModelGridnavFlight({this.item2, this.item1, this.endColor, this.mainItem, this.item4, this.item3, this.startColor});

	DynamicModelGridnavFlight.fromJson(Map<String, dynamic> json) {
		item2 = json['item2'] != null ? new DynamicModelGridnavFlightItem2.fromJson(json['item2']) : null;
		item1 = json['item1'] != null ? new DynamicModelGridnavFlightItem1.fromJson(json['item1']) : null;
		endColor = json['endColor'];
		mainItem = json['mainItem'] != null ? new DynamicModelGridnavFlightMainitem.fromJson(json['mainItem']) : null;
		item4 = json['item4'] != null ? new DynamicModelGridnavFlightItem4.fromJson(json['item4']) : null;
		item3 = json['item3'] != null ? new DynamicModelGridnavFlightItem3.fromJson(json['item3']) : null;
		startColor = json['startColor'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
		if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
		data['endColor'] = this.endColor;
		if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
		if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
		if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
		data['startColor'] = this.startColor;
		return data;
	}
}

class DynamicModelGridnavFlightItem2 {
	String title;
	String url;

	DynamicModelGridnavFlightItem2({this.title, this.url});

	DynamicModelGridnavFlightItem2.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelGridnavFlightItem1 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavFlightItem1({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavFlightItem1.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavFlightMainitem {
	String icon;
	String title;
	String url;

	DynamicModelGridnavFlightMainitem({this.icon, this.title, this.url});

	DynamicModelGridnavFlightMainitem.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelGridnavFlightItem4 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavFlightItem4({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavFlightItem4.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavFlightItem3 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavFlightItem3({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavFlightItem3.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavHotel {
	DynamicModelGridnavHotelItem2 item2;
	DynamicModelGridnavHotelItem1 item1;
	String endColor;
	DynamicModelGridnavHotelMainitem mainItem;
	DynamicModelGridnavHotelItem4 item4;
	DynamicModelGridnavHotelItem3 item3;
	String startColor;

	DynamicModelGridnavHotel({this.item2, this.item1, this.endColor, this.mainItem, this.item4, this.item3, this.startColor});

	DynamicModelGridnavHotel.fromJson(Map<String, dynamic> json) {
		item2 = json['item2'] != null ? new DynamicModelGridnavHotelItem2.fromJson(json['item2']) : null;
		item1 = json['item1'] != null ? new DynamicModelGridnavHotelItem1.fromJson(json['item1']) : null;
		endColor = json['endColor'];
		mainItem = json['mainItem'] != null ? new DynamicModelGridnavHotelMainitem.fromJson(json['mainItem']) : null;
		item4 = json['item4'] != null ? new DynamicModelGridnavHotelItem4.fromJson(json['item4']) : null;
		item3 = json['item3'] != null ? new DynamicModelGridnavHotelItem3.fromJson(json['item3']) : null;
		startColor = json['startColor'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
		if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
		data['endColor'] = this.endColor;
		if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
		if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
		if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
		data['startColor'] = this.startColor;
		return data;
	}
}

class DynamicModelGridnavHotelItem2 {
	String title;
	String url;

	DynamicModelGridnavHotelItem2({this.title, this.url});

	DynamicModelGridnavHotelItem2.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelGridnavHotelItem1 {
	String statusBarColor;
	String title;
	String url;

	DynamicModelGridnavHotelItem1({this.statusBarColor, this.title, this.url});

	DynamicModelGridnavHotelItem1.fromJson(Map<String, dynamic> json) {
		statusBarColor = json['statusBarColor'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['statusBarColor'] = this.statusBarColor;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelGridnavHotelMainitem {
	String statusBarColor;
	String icon;
	String title;
	String url;

	DynamicModelGridnavHotelMainitem({this.statusBarColor, this.icon, this.title, this.url});

	DynamicModelGridnavHotelMainitem.fromJson(Map<String, dynamic> json) {
		statusBarColor = json['statusBarColor'];
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['statusBarColor'] = this.statusBarColor;
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}

class DynamicModelGridnavHotelItem4 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavHotelItem4({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavHotelItem4.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavHotelItem3 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavHotelItem3({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavHotelItem3.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavTravel {
	DynamicModelGridnavTravelItem2 item2;
	DynamicModelGridnavTravelItem1 item1;
	String endColor;
	DynamicModelGridnavTravelMainitem mainItem;
	DynamicModelGridnavTravelItem4 item4;
	DynamicModelGridnavTravelItem3 item3;
	String startColor;

	DynamicModelGridnavTravel({this.item2, this.item1, this.endColor, this.mainItem, this.item4, this.item3, this.startColor});

	DynamicModelGridnavTravel.fromJson(Map<String, dynamic> json) {
		item2 = json['item2'] != null ? new DynamicModelGridnavTravelItem2.fromJson(json['item2']) : null;
		item1 = json['item1'] != null ? new DynamicModelGridnavTravelItem1.fromJson(json['item1']) : null;
		endColor = json['endColor'];
		mainItem = json['mainItem'] != null ? new DynamicModelGridnavTravelMainitem.fromJson(json['mainItem']) : null;
		item4 = json['item4'] != null ? new DynamicModelGridnavTravelItem4.fromJson(json['item4']) : null;
		item3 = json['item3'] != null ? new DynamicModelGridnavTravelItem3.fromJson(json['item3']) : null;
		startColor = json['startColor'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
		if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
		data['endColor'] = this.endColor;
		if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
		if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
		if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
		data['startColor'] = this.startColor;
		return data;
	}
}

class DynamicModelGridnavTravelItem2 {
	String statusBarColor;
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavTravelItem2({this.statusBarColor, this.title, this.url, this.hideAppBar});

	DynamicModelGridnavTravelItem2.fromJson(Map<String, dynamic> json) {
		statusBarColor = json['statusBarColor'];
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['statusBarColor'] = this.statusBarColor;
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavTravelItem1 {
	String statusBarColor;
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavTravelItem1({this.statusBarColor, this.title, this.url, this.hideAppBar});

	DynamicModelGridnavTravelItem1.fromJson(Map<String, dynamic> json) {
		statusBarColor = json['statusBarColor'];
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['statusBarColor'] = this.statusBarColor;
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavTravelMainitem {
	String statusBarColor;
	String icon;
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavTravelMainitem({this.statusBarColor, this.icon, this.title, this.url, this.hideAppBar});

	DynamicModelGridnavTravelMainitem.fromJson(Map<String, dynamic> json) {
		statusBarColor = json['statusBarColor'];
		icon = json['icon'];
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['statusBarColor'] = this.statusBarColor;
		data['icon'] = this.icon;
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavTravelItem4 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavTravelItem4({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavTravelItem4.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}

class DynamicModelGridnavTravelItem3 {
	String title;
	String url;
	bool hideAppBar;

	DynamicModelGridnavTravelItem3({this.title, this.url, this.hideAppBar});

	DynamicModelGridnavTravelItem3.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
		hideAppBar = json['hideAppBar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		data['hideAppBar'] = this.hideAppBar;
		return data;
	}
}
