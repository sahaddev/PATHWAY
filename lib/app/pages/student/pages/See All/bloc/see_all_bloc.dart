// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_way_flu/app/data/middleware/student.dart';
import 'package:path_way_flu/app/data/middleware/teacher.dart';
import 'package:path_way_flu/app/data/model/lession.dart';
import 'package:path_way_flu/main.dart';

part 'see_all_event.dart';
part 'see_all_state.dart';
part 'see_all_bloc.freezed.dart';

class SeeAllBloc extends Bloc<SeeAllEvent, SeeAllState> {
  SeeAllBloc() : super(SeeAllState.initial()) {
    on<_givingInitialValue>((event, emit) async {
      List<Lesson> fetchedList = [];
      try {
        fetchedList = await TeacherApi.getAllLession();
      } catch (e) {
        fetchedList = [];
      }
      if (fetchedList.isEmpty) {
        fetchedList = [
          Lesson(
            id: '1',
            title: 'Calculus Fundamentals',
            subject: 'Mathematics',
            creatorId: 'c1',
            coverImage: '',
            creatorName: 'Dr. Smith',
            price: 499,
            watchTime: 120,
            lessonId: ['l1', 'l2', 'l3'],
          ),
          Lesson(
            id: '2',
            title: 'Advanced Integration',
            subject: 'Mathematics',
            creatorId: 'c2',
            coverImage: '',
            creatorName: 'Prof. John',
            price: 799,
            watchTime: 90,
            lessonId: ['l4', 'l5'],
          ),
          Lesson(
            id: '3',
            title: 'Limits & Continuity',
            subject: 'Mathematics',
            creatorId: 'c3',
            coverImage: '',
            creatorName: 'Sarah Jenkins',
            price: 299,
            watchTime: 60,
            lessonId: [],
          ),
        ];
      }
      emit(state.copyWith(list: fetchedList));
    });

    on<_fulturedValue>((event, emit) async {
      emit(state.copyWith(list: await TeacherApi.getAllLession()));

      List<Lesson> result = [];

      if (event.typeText.isEmpty) {
        result = state.list;
      } else {
        result = state.list
            .where((user) =>
                user.title.toLowerCase().contains(event.typeText.toLowerCase()))
            .toList();
      }
      emit(state.copyWith(list: result));
    });

    on<_navigatingMaker>((event, emit) {
      StudentApi.getOneStudentForDeatilePage(
          context: event.context,
          lessionId: event.lesson.id,
          lesson: event.lesson,
          studentId: userId);
    });
  }
}
