GetX State Management

GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

GetX has 3 basic principles. This means that these are the priority for all resources in the library: PRODUCTIVITY, PERFORMANCE AND ORGANIZATION.

PERFORMANCE: GetX is focused on performance and minimum consumption of resources. GetX does not use Streams or ChangeNotifier.

PRODUCTIVITY: GetX uses an easy and pleasant syntax. No matter what you want to do, there is always an easier way with GetX. It will save hours of development and will provide the maximum performance your application can deliver.

Generally, the developer should be concerned with removing controllers from memory. With GetX this is not necessary because resources are removed from memory when they are not used by default. If you want to keep it in memory, you must explicitly declare "permanent: true" in your dependency. That way, in addition to saving time, you are less at risk of having unnecessary dependencies on memory. Dependency loading is also lazy by default.

ORGANIZATION: GetX allows the total decoupling of the View, presentation logic, business logic, dependency injection, and navigation. You do not need context to navigate between routes, so you are not dependent on the widget tree (visualization) for this. You don't need context to access your controllers/blocs through an inherited widget, so you completely decouple your presentation logic and business logic from your visualization layer. You do not need to inject your Controllers/Models/Blocs classes into your widget tree through MultiProviders. For this, GetX uses its own dependency injection feature, completely decoupling the DI from its view.

Installing 
Add Get to your pubspec.yaml file:
dependencies:
  get:

Import get in files that it will be used:
import 'package:get/get.dart';

You can learn and gain experience of basic GetX features working from this code that explains the following things. 
![getx](https://github.com/user-attachments/assets/b303bd06-9f72-409d-ba5b-3a35a97b7bfa)
