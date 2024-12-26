import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:logger/logger.dart';

class MongoDBService {
  // MongoDB connection URI
    String _mongoUri = "mongodb+srv://27839:subi27839@cluster0.fcvsm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
  // Logger instance
  final Logger _logger = Logger();

  // MongoDB database instance
  late mongo.Db _db;

  /// Initialize and connect to MongoDB
  Future<void> connect() async {
    _db = mongo.Db(MONGO_URL);

    try {
      _logger.i("Attempting to connect to MongoDB...");
      await _db.open();
      _logger.i("MongoDB connection established successfully.");
    } catch (e) {
      _logger.e("Failed to connect to MongoDB: ${e.toString()}");
    }
  }

  /// Close MongoDB connection
  Future<void> close() async {
    try {
      await _db.close();
      _logger.i("MongoDB connection closed.");
    } catch (e) {
      _logger.e("Error closing MongoDB connection: ${e.toString()}");
    }
  }

  /// Get a collection
  mongo.DbCollection getCollection(String collectionName) {
    if (_db.state != mongo.State.OPEN) {
      throw Exception("Database connection is not open.");
    }
    return _db.collection(collectionName);
  }
}
