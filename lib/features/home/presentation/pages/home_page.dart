import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_state.dart';
import 'package:flutter_assignment/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl<ProductBloc>()..add(const GetProducts()),
        child: _buildBody(),
      )
    );
  }

  _buildBody(){
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state){
          if(state is ProductsLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ProductsLoaded) {
            return const Center(
                child: Text("Home Page"));
          }
          return const SizedBox();
        });
  }
}
