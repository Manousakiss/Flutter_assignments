import 'package:flutter/material.dart';

// for each article it creates a scaffold with app bar and red color
// each path has its own title and text
class Article0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is depression?'),
        backgroundColor: Colors.red,
      ),
      body: const Text(
          "Some of these comments may be well-intentioned but they show a lack of understanding of the nature of depression. The problem is rooted in the use of the word “depression” as a diagnosis. The reason this is a problem is due to the word “depression” also being used by the public to describe a mood such as “I'm feeling depressed today.” However, a temporary mood and a diagnosable illness are two very different things. So the use of the same term to describe apples and oranges creates a great deal of confusion and misunderstanding."
          "\n \nIt certainly would make sense if we could change the name of the diagnosis to something else: “XYZ Disorder” that wouldn't have any other association in the public's mind. However, this was tried by the mental health profession in the past when they changed the diagnostic term manic-depression to bipolar disorder. At the same time they changed major depression to unipolar disorder but it wasn't accepted in either the public's mind or the profession's. Therefore, the best we can do at this point is to try and distinguish between the diagnosable conditions of depression and the common use of the word “depression.”"),
    );
  }
}

class Article1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Why is this a problem?'),
        backgroundColor: Colors.red,
      ),
      body: const Text(
          "If the public calls this temporary mood state “depression” they will erroneously believe that they know what it feels like to be depressed in the clinical sense of the word. However, they will be wrong! Even though they are wrong, it won't stop them from making certain assumptions and comments that can be very detrimental to people who have a diagnosable condition."
          "\n\nIn particular, they are likely to have beliefs or even make comments such as “When I was depressed, I just snapped myself out of it” or “Depression is just a matter of attitude.” Certainly, these comments may relate to a temporary mood state, but they do not apply to the depressive disorders. Not only that, but saying these types of things to a depressed person can only serve to make them feel worse."
          "\n\nHowever, these critical attitudes can make the depression worse. It is difficult enough for a person to manage the depression without having the additional stress of feeling like a failure."),
    );
  }
}

class Article2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('When is depression caused by stress?'),
          backgroundColor: Colors.red,
        ),
        body: const Text(
            "Although the above conditions appear to be biological conditions that are caused by genetic predispositions, some people may experience temporary symptoms of depression due to stress. Such a condition is typically diagnosed as an adjustment disorder with depression or in the case of a traumatic experience may be diagnosed as an acute stress reaction."
            "\n\nAn adjustment disorder may involve the depressive symptoms but the symptoms can be traced to a single event or a period of stress in a person's life. In addition, an adjustment disorder is not likely to be recurrent unless triggered by other events or periods of stress. However, this condition should not be confused with a depressive illness which has an underlying biological cause as we understand it today."
            "\n\nAn adjustment disorder, in particular, can be very receptive to CBT methods since these methods directly impact the ability to cope with stress. In addition, practicing stress management methods and addressing daily stress is likely to be helpful in preventing the occurrence of an adjustment disorder."));
  }
}

class Article3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Why does it seem that depression is caused by stress?'),
          backgroundColor: Colors.red,
        ),
        body: const Text(
            "The fact is that the depressive disorders, as is true of most of the physical disorders, are reactive to stress. This is due to the physiological impact of stress as well as the psychological impact. For instance, if a person has the common cold, their body will marshal the defenses such as producing white blood cells, adrenalin, and cortisol to fight the invading germs. When the body does this it requires additional energy and it reduces the functioning of other systems to obtain this energy. Therefore, a person will feel fatigued and will tend to be less active."
            "\n\nThe problem is that we only have so much in terms of physiological resources. In addition, the psychological impact of stress is that a person finds it more difficult to do the necessary self-care. With a common cold, for example, it may be hard to obtain the necessary rest. As a result of the physiological and psychological factors, it becomes more difficult to recover from the common cold."
            "\n\nThis same process occurs with clinical depression. The more stressors in a person's life, the more difficult it becomes to recover from the depression. Therefore, many people will tend to associate the presence of these stressors as the cause of the depression. However, that is not the case. The stressors may impact the depression and make it worse or more difficult to recover, but they are not typically the cause. In fact, if a stressor is the cause, it is likely a different condition known as an adjustment disorder rather than depression which we will discuss later."
            "\n\nHowever, those sorts of suggestions and comments without a full understanding of clinical depression become detrimental rather than helpful because they can be seen as an attack which is just another stressor for the depressed individual."));
  }
}
