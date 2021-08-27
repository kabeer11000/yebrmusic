# Yebr Cast Serer
This microservice provides cast functionality in Yebr Music.

### Architecture
Shared user_id is used to create a cast room. Each client then pushes intent to other clients in the room.
Events contain `Play`, `Pause`... and more

Yebr Music Cast based on Kabeer Cast (R) Spec
https://opensource.developers.kabeersnetwork.tk/spec/KabeerCast@f23fa0
