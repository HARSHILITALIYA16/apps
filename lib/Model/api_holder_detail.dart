class ApiHolderDetail {
	int? resultCount;
	List<Results>? results;

	ApiHolderDetail({this.resultCount, this.results});

	ApiHolderDetail.fromJson(Map<String, dynamic> json) {
		resultCount = json['resultCount'];
		if (json['results'] != null) {
			results = <Results>[];
			json['results'].forEach((v) {
				results!.add(new Results.fromJson(v));
			});
		}
	}
}

class Results {
	List<String>? screenshotUrls;
	List<String>? ipadScreenshotUrls;
	List<Null>? appletvScreenshotUrls;
	bool? isGameCenterEnabled;
	List<String>? features;
	List<String>? supportedDevices;
	List<String>? advisories;
	String? artworkUrl60;
	String? artworkUrl512;
	String? artworkUrl100;
	String? artistViewUrl;
	String? kind;
	String? currency;
	int? artistId;
	String? artistName;
	List<String>? genres;
	double? price;
	String? description;
	List<String>? genreIds;
	String? bundleId;
	String? releaseDate;
	int? trackId;
	String? trackName;
	String? sellerName;
	String? primaryGenreName;
	int? primaryGenreId;
	bool? isVppDeviceBasedLicensingEnabled;
	String? releaseNotes;
	String? currentVersionReleaseDate;
	String? trackViewUrl;
	String? minimumOsVersion;
	String? trackCensoredName;
	List<String>? languageCodesISO2A;
	String? fileSizeBytes;
	String? formattedPrice;
	String? contentAdvisoryRating;
	double? averageUserRatingForCurrentVersion;
	int? userRatingCountForCurrentVersion;
	double? averageUserRating;
	String? trackContentRating;
	String? version;
	String? wrapperType;
	int? userRatingCount;

	Results(
			{this.screenshotUrls,
				this.ipadScreenshotUrls,
				this.appletvScreenshotUrls,
				this.isGameCenterEnabled,
				this.features,
				this.supportedDevices,
				this.advisories,
				this.artworkUrl60,
				this.artworkUrl512,
				this.artworkUrl100,
				this.artistViewUrl,
				this.kind,
				this.currency,
				this.artistId,
				this.artistName,
				this.genres,
				this.price,
				this.description,
				this.genreIds,
				this.bundleId,
				this.releaseDate,
				this.trackId,
				this.trackName,
				this.sellerName,
				this.primaryGenreName,
				this.primaryGenreId,
				this.isVppDeviceBasedLicensingEnabled,
				this.releaseNotes,
				this.currentVersionReleaseDate,
				this.trackViewUrl,
				this.minimumOsVersion,
				this.trackCensoredName,
				this.languageCodesISO2A,
				this.fileSizeBytes,
				this.formattedPrice,
				this.contentAdvisoryRating,
				this.averageUserRatingForCurrentVersion,
				this.userRatingCountForCurrentVersion,
				this.averageUserRating,
				this.trackContentRating,
				this.version,
				this.wrapperType,
				this.userRatingCount});

	Results.fromJson(Map<String, dynamic> json) {
		screenshotUrls = json['screenshotUrls'].cast<String>();
		ipadScreenshotUrls = json['ipadScreenshotUrls'].cast<String>();
		isGameCenterEnabled = json['isGameCenterEnabled'];
		features = json['features'].cast<String>();
		supportedDevices = json['supportedDevices'].cast<String>();
		advisories = json['advisories'].cast<String>();
		artworkUrl60 = json['artworkUrl60'];
		artworkUrl512 = json['artworkUrl512'];
		artworkUrl100 = json['artworkUrl100'];
		artistViewUrl = json['artistViewUrl'];
		kind = json['kind'];
		currency = json['currency'];
		artistId = json['artistId'];
		artistName = json['artistName'];
		genres = json['genres'].cast<String>();
		price = json['price'];
		description = json['description'];
		genreIds = json['genreIds'].cast<String>();
		bundleId = json['bundleId'];
		releaseDate = json['releaseDate'];
		trackId = json['trackId'];
		trackName = json['trackName'];
		sellerName = json['sellerName'];
		primaryGenreName = json['primaryGenreName'];
		primaryGenreId = json['primaryGenreId'];
		isVppDeviceBasedLicensingEnabled = json['isVppDeviceBasedLicensingEnabled'];
		releaseNotes = json['releaseNotes'];
		currentVersionReleaseDate = json['currentVersionReleaseDate'];
		trackViewUrl = json['trackViewUrl'];
		minimumOsVersion = json['minimumOsVersion'];
		trackCensoredName = json['trackCensoredName'];
		languageCodesISO2A = json['languageCodesISO2A'].cast<String>();
		fileSizeBytes = json['fileSizeBytes'];
		formattedPrice = json['formattedPrice'];
		contentAdvisoryRating = json['contentAdvisoryRating'];
		averageUserRatingForCurrentVersion =
		json['averageUserRatingForCurrentVersion'];
		userRatingCountForCurrentVersion = json['userRatingCountForCurrentVersion'];
		averageUserRating = json['averageUserRating'];
		trackContentRating = json['trackContentRating'];
		version = json['version'];
		wrapperType = json['wrapperType'];
		userRatingCount = json['userRatingCount'];
	}


}
