import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/home/presentations/controllers/sign_out_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w(context)),
      child: Column(
        children: [
          const HomeAppBar(),
          SizedBoxApp(
            h: 57.h(context),
          ),
          BlocConsumer<SignOutCubit, SignOutState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              if(state is HomeDataSuccess){
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 130.w(context) / 173.h(context),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w(context),
                      mainAxisSpacing: 20.h(context),
                    ),
                    itemCount: state.message.docs.length,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryView(title: itemsName[index]),
                                ));
                          },
                          child: CustomHomeItem(
                            image: state.message.docs[index].get('imageUrl'),
                            text: state.message.docs[index].get('name'),
                          ),
                        ),
                  ),
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ],
      ),
    );
  }
}
