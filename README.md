### Basic principles
As you know the core of the project is to test wheter single-eye effects can be used to convey impact more effectively. 
To do so we need a way to show the elements we want through a single eye at a time, to do so in godot we have to consider each eye has one viewport, essentially one camera, and index this viewport from the shader.
For that we will reuse the following shader node structure(found in star_shader.tres) where we can set the ViewIndex parameter to 0,1 or any other number above 2. 0 and 1 each stand for one of the eyes and the rest of the numbers will show the item with the shader through both eyes.
![image](https://github.com/user-attachments/assets/42430926-f4a8-4a03-b44d-aca3ef57fd5f)

Since most of what's to be done is particle related I suggest looking up the existing particles(most of them are inside the explosion.tscn scene) or checking a few of the resources I'll link here:
- https://www.youtube.com/watch?v=tjSxICUXMmM&t=96s


### TODO
#### Work on the presentation(Due 13th)
- Not much needs to be explained on this one

#### Improve big explosion
- Make an explosion variantion with no eye-dependant effects
- Maybe tweak the keyframes in the animation node to make it better looking
- Add a few literal impact frames by sampling the entire image and thresholding it to achive a look similar to animation impact frames(examples below)(Unai is looking into this)
![image](https://github.com/user-attachments/assets/6d535a42-5516-4d7d-8993-7482807d4ab2)
![](https://github.com/unaiLarra/VR-Final-Project/blob/main/Assets/References/impact_frame.gif)

#### Create eye-dependent weapon effects
- Create muzzle-flash like effects for the weapons(there's only two of them so it shouldn't be much work) and experiment with making them eye dependant.
- Create a variation for each weapon, one with the eye-dependant effects, one without.
- Add a label to the weapons to indicate which type they are

#### Add sound effect
- This is not mandatory but would go a long way on giving polish to the project, there's surely free sounds libraries that'll do just fine.
