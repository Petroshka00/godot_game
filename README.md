# Godot game

This project is currently being developed and is not yet finished. The goal of this project is to learn to make a game by myself, taking a deep dive in the different algorithms, techniques and architectures that are usually needed for game development.

Below this section, you will see the progress that i made with the game, also, some code will be provided in case you want to read the files corresponding to the examples that i will be uploading.

## Enemy behaviours

Different enemies in this game will have different behaviours when moving, attacking, approaching the player, etc.
To solve this issue, i used finite state machines (FSMs).
In this example video, it can be observed how, when the player is far away from the slime enemies, the slimes will just wander randomly and when they are approached, they will begin to chase the player down, this is all managed by a finite state machine with different states.

![Slimes](/readme_resources/Slime%20behaviours.gif)

## Hitboxes and hurtboxes

This is quite self explanatory, enemies need to hit you, and you need to hit them, so i implemented the following components:
* Health
* Damage
* Hitbox
* Hurtbox

Just in case, hitbox is the detection area for dealing damage and hurtbox is the detection area for receiving damage.

That being said, the health component is "coupled" with the hurtbox component, because the hurtbox component is the one that detect the damage being received and has the responsibility of notifying the health component, however, they exist separately and are not dependent on each other to work. This separation of hurtbox and health makes it so if i want to implement, for example, a healthless entity that can be struck, i just need to add a hurtbox component but without adding a health component to this entity.

The same can be said for damage and hitbox, as hitbox takes the value of the damage from the damage component. Again, this separation makes it more flexible for future implementation.

Here is an example of a slime being struck and eventually killed by the player:

![Hitboxes](/readme_resources/Hitboxes%20and%20hurtboxes.gif)