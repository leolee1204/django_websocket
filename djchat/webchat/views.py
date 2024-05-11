from datetime import datetime

from rest_framework import viewsets
from rest_framework.response import Response

from .models import Conversation
from .schemas import list_message_docs
from .serializers import MessageSerializer


class MessageViewSet(viewsets.ViewSet):
    @list_message_docs
    def list(self, request):
        channel_id = request.query_params.get("channel_id")

        try:
            print(datetime.today())
            conversation = Conversation.objects.get(channel_id=channel_id)
            message = conversation.message.filter(timestamp__gte=datetime.today())
            serializer = MessageSerializer(message, many=True)
            return Response(serializer.data)
        except Conversation.DoesNotExist:
            return Response([])
