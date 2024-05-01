import 'package:equatable/equatable.dart';

class NewsModels extends Equatable {
  const NewsModels({
    required this.imageId,
    required this.title,
    required this.id,
  });

  final String imageId;
  final String title;
  final int id;

  @override
  List<Object?> get props => [imageId, title, id,];
}
