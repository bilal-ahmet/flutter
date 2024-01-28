import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/widgets/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;

  @override
  void initState() {

    super.initState();
    _allTasks = <Task>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              _showAddTaskBootmSheet(context);
            },
            child: const Text(
              "bügün neler yapacaksın",
              style: TextStyle(color: Colors.black),
            )),
        centerTitle:
            false, // ios'ta başlıklar ortadan başlar onu engellemek için kullanılıyor
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                _showAddTaskBootmSheet(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),

      body: _allTasks.isNotEmpty ? ListView.builder(itemCount: _allTasks.length, itemBuilder: (context, index) {
        var _oankiListeEleman = _allTasks[index];

        // kaydırarak ListTile'dan çıkartma işlemi için kullanılıyor. 
        return Dismissible(

          // key değerinin uniq olması gerekiyor o yüzden Uuid ile oluşturduğumuz değeri buraya atabiliriz.
          key: Key(_oankiListeEleman.id),

          background: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.grey,),
              SizedBox(width: 12,),
              Text("bu görev silindi")
            ],
          ),
          onDismissed: (direction) {
            _allTasks.removeAt(index);
            setState(() {
              
            });
          },
          child: TaskItem(task: _oankiListeEleman)
        );
      },) : const Center(child: Text("haydi görev ekle"),)
    );
  }

  void _showAddTaskBootmSheet(BuildContext context) {
    // alttan açılan bir pencere sağlıyor.
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,

          // TextField kullanıldığı zaman klavye onun üzerine gelerek kapatıyor, bu kod ile engellenebilmektedir.
          padding: MediaQuery.of(context).viewInsets,
          child: ListTile(
            title: TextField(
              decoration: const InputDecoration(
                  hintText: "görev nedir ?",

                  // ListTile ile gelen alt çizgiyi kaldırmak için kullanılıyor.
                  border: InputBorder.none),

              // text field'a yazı yazıldıktan sonra okey işaretine basılması onSubmitted ile tutuluyor. bu işlemden sonra ekranı kapattık
              onSubmitted: (value) {
                Navigator.pop(context);
              
                DatePicker.showTimePicker(context, showSecondsColumn: false, onConfirm: (time) {
                  var yeniEklenecekGorev = Task.create(isim: value, createdAt: time);
                  _allTasks.add(yeniEklenecekGorev);
                  setState(() {
                    
                  });
                },);
              },    
            ),
          ),
        );
      },
    );
  }
}
