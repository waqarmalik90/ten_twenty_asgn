class ImageResponse{
  int? PoleID;
  String? FileTagName;
  String? NewFileName;
  int? TagID;

  ImageResponse({this.PoleID, this.FileTagName, this.NewFileName, this.TagID});

  ImageResponse.fromJson(Map<String, dynamic> json)
      : PoleID = json['PoleID'] ,
        FileTagName = json['FileTagName'] ,
        NewFileName = json['NewFileName'] ,
        TagID = json['TagID']
     ;


  Map<String, dynamic> toJson() => {
    'PoleID' : PoleID,
    'FileTagName' : FileTagName,
    'NewFileName' : NewFileName,
    'TagID':TagID
  };

}