import 'chat.dart';

List<Conversation> conversations = [
  Conversation(
      user: User(
          uuid: "e1ae3dae-ef6e-404d-8919-590eb4c113c9",
          username: "mike",
          name: "Mike",
          avatarUrl:
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F5b0901af-9739-4ad2-9a87-32750c777c57%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1692681076&t=88929d5c5c641215620132ec11477734",
          description: ""),
      messages: [
        Message(
            sender: "e1ae3dae-ef6e-404d-8919-590eb4c113c9",
            time: "2023-07-23 00:02:00",
            content: "Hi, LGBTQ+Connect",
            imgUrl: ""),
        Message(
            sender: "",
            time: "2023-07-23 00:02:05",
            content:
                "Hi, LGBTQ+Connect.########################################################",
            imgUrl: ""),
      ],
      lastMessageTime: "2023-07-23 00:02:00"),
  Conversation(
      user: User(
          uuid: "1a87e5ac-be0e-42c6-bf18-54c4a3e25b6a",
          username: "will",
          name: "William",
          avatarUrl:
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Ff02e4c1e-2d10-42e5-a3b7-412558bbbc60%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1692681076&t=2b61beba68f000225b50556ca15b8862",
          description: ""),
      messages: [
        Message(
            sender: "1a87e5ac-be0e-42c6-bf18-54c4a3e25b6a",
            time: "2023-07-23 00:04:01",
            content: "Hi, LGBTQ+Connect.hahahahahahahahahaha",
            imgUrl: ""),
        Message(
            sender: "",
            time: "2023-07-23 00:04:01",
            content: "",
            imgUrl:
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F922ed896-4a20-4173-b70f-9a7862ac3e38%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1692681076&t=fe50f3a6d56476feeb5425a79e9e0c3f"),
      ],
      lastMessageTime: "2023-07-23 00:04:01"),
];
