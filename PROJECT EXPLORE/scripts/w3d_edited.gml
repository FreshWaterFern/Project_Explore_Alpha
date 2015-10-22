#define w3d_test_texture
/*
w3d_test_texture(texture_index,path_index,width,height)
For testing and making textures only.
Draws the texture with the path on the side, to see what vertexes will draw what part of the texture.

Script made by TheSnidr
www.thesnidr.com
*/
draw_set_color(c_white)
tex=argument0
xtex=texture_get_width(tex)
ytex=texture_get_height(tex)

draw_primitive_begin_texture(pr_trianglestrip,tex)

draw_vertex_texture((room_width-argument2)/2,(room_height-argument3)/2,0,0)
draw_vertex_texture((room_width+argument2)/2,(room_height-argument3)/2,xtex,0)
draw_vertex_texture((room_width-argument2)/2,(room_height+argument3)/2,0,ytex)
draw_vertex_texture((room_width+argument2)/2,(room_height+argument3)/2,xtex,ytex)

draw_primitive_end()

nr=path_get_number(argument1)
draw_set_color(c_red)
for (i=0;i<=nr;i+=1)
{
    pos=w3d_path_position(argument1,i)
    xx=(room_width-argument2)/2
    yy=(room_height-argument3)/2+argument3*pos
    draw_line(xx-50,yy,xx+32,yy)
    draw_text(xx-60,yy-5,string(i+1))
}
#define w3d_model_create
/*
w3d_model_create(path_index)
Creates a fake 3d model by "spinning" a path.
Returns the index of the new model.

Script made by TheSnidr
www.thesnidr.com
*/
globalvar w3d_mod_q,w3d_mod_nr,w3d_mod_low,w3d_mod_zz,w3d_mod_ytex;
var list,i,u;
list=ds_list_create()
w3d_mod_nr[list]=path_get_number(argument0)
w3d_mod_low[list]=path_get_point_y(argument0,w3d_mod_nr[list]-1)
for (i=0;i<=w3d_mod_nr[list];i+=1)
{
    ds_list_add(list,path_get_point_x(argument0,i))
    w3d_mod_zz[i,list]=w3d_mod_low[list]-path_get_point_y(argument0,i)
    w3d_mod_zz2[i,list]=w3d_calculate_z(w3d_mod_zz[i,list])
    w3d_mod_ytex[i,list]=w3d_path_position(argument0,i)
}
return list;
#define w3d_model_draw
/*
w3d_model_draw(model,texture,x,y)
The width of the texture must be a size the power of two. That means,
2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, and so on.

Script made by TheSnidr
www.thesnidr.com
Rotation by tito100
*/
var l,z1,z2,i,u,u1,nr,q,d1,d2,xt,yt1,yt2,xx,yy,_sin,_cos;
texture_set_repeat(true)
l=argument0
nr=w3d_mod_nr[l]-1
q=5 //This is the quality variable. By default it is set to 5
u1=floor(q*((point_direction(x,y,view_xview+view_wview/2,view_yview+view_hview/2)+110)/360))

draw_primitive_begin_texture(pr_trianglestrip,argument1)
for (i=nr;i>0;i-=1)
{
    if i<nr{z1=z2 d1=d2 yt1=yt2}else{z1=w3d_mod_zz2[i,l] d1=ds_list_find_value(l,i) yt1=w3d_mod_ytex[i,l]}
    z2=w3d_mod_zz2[i-1,l]
    d2=ds_list_find_value(l,i-1)
    yt2=w3d_mod_ytex[i-1,l]
    for (u=0;u<=q;u+=1)
    {
        uu=(u1+u)
        xt=uu/q
        dir=2*pi*xt
        _cos=cos(dir)
        _sin=sin(dir)
        xx=argument2+d1*_cos
        yy=argument3-d1*_sin
        draw_vertex_texture(xx-z1*w3d_get_hor(xx),yy-z1*w3d_get_ver(yy),xt,yt1)
        xx=argument2+d2*_cos
        yy=argument3-d2*_sin
        draw_vertex_texture(xx-z2*w3d_get_hor(xx),yy-z2*w3d_get_ver(yy),xt,yt2)
    }
}
draw_primitive_end()
#define w3d_model_draw_ext
/*
w3d_model_draw_ext(model,texture,vertexes,x,y,z,scale,angle)
The width of the texture must be a size the power of two. That means,
2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, and so on.

Script made by TheSnidr
www.thesnidr.com
Rotation by tito100
*/
var l,z1,z2,i,u,u1,nr,q,d1,d2,xt,yt1,yt2,xx,yy,_sin,_cos;
texture_set_repeat(true)
l=argument0
nr=w3d_mod_nr[l]-1
q=argument2
u1=floor(q*((point_direction(x,y,view_xview+view_wview/2,view_yview+view_hview/2)+90-argument7 mod 360)/360))

draw_primitive_begin_texture(pr_trianglestrip,argument1)
for (i=nr;i>0;i-=1)
{
    if i<nr{z1=z2 d1=d2 yt1=yt2}else{z1=w3d_calculate_z(w3d_mod_zz[i,l]*argument6+argument5) d1=ds_list_find_value(l,i)*argument6 yt1=w3d_mod_ytex[i,l]}
    z2=w3d_calculate_z(w3d_mod_zz[i-1,l]*argument6+argument5)
    d2=ds_list_find_value(l,i-1)*argument6
    yt2=w3d_mod_ytex[i-1,l]
    for (u=0;u<=q;u+=1)
    {
        uu=(u1+u)
        xt=uu/q
        dir=degtorad(360*xt+argument7)
        _cos=cos(dir)
        _sin=sin(dir)
        xx=argument3+d1*_cos
        yy=argument4-d1*_sin
        draw_vertex_texture(xx-z1*w3d_get_hor(xx),yy-z1*w3d_get_ver(yy),xt,yt1)
        xx=argument3+d2*_cos
        yy=argument4-d2*_sin
        draw_vertex_texture(xx-z2*w3d_get_hor(xx),yy-z2*w3d_get_ver(yy),xt,yt2)
    }
}
draw_primitive_end()
#define w3d_draw_point
/*
w3d_draw_point(x,y,z)
Draws a point at (x,y,z)

Script made by TheSnidr
www.thesnidr.com
*/
var z;
z=w3d_calculate_z(argument2)
draw_point(
argument0-(z*w3d_get_hor(argument0)), //x
argument1-(z*w3d_get_ver(argument1))) //y
#define w3d_draw_line
/*
w3d_draw_line(x1,y1,z1,x2,y2,z2)
Draws a line from (x1,y1,z1) to (x2,y2,z2)

Script made by TheSnidr
www.thesnidr.com
*/
var z1,z2;
z1=w3d_calculate_z(argument2)
z2=w3d_calculate_z(argument5)
draw_line(
argument0-(z1*w3d_get_hor(argument0)), //x1
argument1-(z1*w3d_get_ver(argument1)), //y1
argument3-(z2*w3d_get_hor(argument3)), //x2
argument4-(z2*w3d_get_ver(argument4))) //y2
#define w3d_draw_rectangle
/*
w3d_draw_rectangle(x1,y1,x2,y2,z,outline)
Draws a rectangle from (x1,y1,z) to (x2,y2,z)

Script made by TheSnidr
www.thesnidr.com
*/

var scale,_hor,_ver;
temp_z=w3d_calculate_z(argument4)
scale= (temp_z/500)
_hor=w3d_get_hor(argument0)
_ver=w3d_get_ver(argument1)

draw_rectangle(argument0-((argument2-argument0)/2)*scale-(temp_z*_hor),argument1-((argument3-argument1)/2)*scale-(temp_z*_ver),argument2+((argument2-argument0)/2)*scale-(temp_z*_hor),argument3+((argument2-argument0)/2)*scale-(temp_z*_ver),argument5)
#define w3d_draw_ellipse
/*
w3d_draw_ellipse(x1,y1,x2,y2,z,outline)
Draws an ellipse at (x1,y1,z). (x2,y2) says how big the ellipse is.

Script made by TheSnidr
www.thesnidr.com
*/

var scale;

temp_z=w3d_calculate_z(argument4)
scale= (temp_z/500)

_hor=w3d_get_hor(argument0)
_ver=w3d_get_ver(argument1)

draw_ellipse(argument0-((argument2-argument0)/2)*scale-(temp_z*_hor),argument1-((argument3-argument1)/2)*scale-(temp_z*_ver),argument2+((argument2-argument0)/2)*scale-(temp_z*_hor),argument3+((argument2-argument0)/2)*scale-(temp_z*_ver),argument5)
#define w3d_draw_pyramid
/*
w3d_draw_pyramid(texture_index,x,y,z,height,xsize,ysize)
Draws a pyramid ("spike") using primitives. 

Script made by TheSnidr
www.thesnidr.com
*/


var z1,z2,midx,midy,n,s,e,w;

z1=w3d_calculate_z(argument3)
z2=w3d_calculate_z(argument3+argument4)
midx=argument1-z2*w3d_get_hor(argument1)
midy=argument2-z2*w3d_get_ver(argument2)

n=argument2-argument6/2
n-=z1*w3d_get_ver(n)
s=argument2+argument6/2
s-=z1*w3d_get_ver(s)
e=argument1+argument5/2
e-=z1*w3d_get_hor(e)
w=argument1-argument5/2
w-=z1*w3d_get_hor(w)

draw_primitive_begin_texture(pr_trianglelist,argument0)
//North
if midy>n{
    draw_vertex_texture(e,n,1,0)
    draw_vertex_texture(midx,midy,0.5,0.5)
    draw_vertex_texture(w,n,0,0)}
//South
if midy<s{
    draw_vertex_texture(e,s,1,1)
    draw_vertex_texture(midx,midy,0.5,0.5)
    draw_vertex_texture(w,s,0,1)}
//East
if midx<e{
    draw_vertex_texture(e,s,1,1)
    draw_vertex_texture(midx,midy,0.5,0.5)
    draw_vertex_texture(e,n,1,0)}
//West
if midx>w{
    draw_vertex_texture(w,s,0,1)
    draw_vertex_texture(midx,midy,0.5,0.5)
    draw_vertex_texture(w,n,0,0)}
draw_primitive_end()
#define w3d_draw_cube
/// w3d_draw_cube(texture,x,y,height,xsize,ysize)
/*
Draws a cube at (x,y,z)
The texture index must be sized a power of two! 
That means 2, 4, 8, 16, 32, 64, 128, 256, 512 and so on
This cube is always drawn with its base at (x,y,0), and top at (x,y,height).
If you want it to be drawn from (x,y,z1) to (x,y,z2), use draw_cube_ext

Script made by TheSnidr
www.thesnidr.com
*/
/////////////////////////////////////////////////////////////////
//Initiate variables
var z2,hor,ver,n1,s1,e1,w1,
xx,yy,scl,e2,w2,n2,s2,hmid,vmid;
/////////////////////////////////////////////////////////////////
//Find the actual z value and horizontal/vertical value of the top of the cube
z2=w3d_calculate_z(argument3)
hor=w3d_get_hor(argument1)
ver=w3d_get_ver(argument2)
argument4/=2 //Width
argument5/=2 //Height
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the bottom of the cube
e1=argument1+argument4
w1=argument1-argument4
n1=argument2-argument5
s1=argument2+argument5
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the top of the cube
xx=argument1-z2*hor
yy=argument2-z2*ver
scl=1+z2/500
e2=xx+(e1-argument1)*scl
w2=xx+(w1-argument1)*scl
n2=yy+(n1-argument2)*scl
s2=yy+(s1-argument2)*scl
/////////////////////////////////////////////////////////////////
//These variables are used when making the extra triangle
hmid=(e2+w2)/2
vmid=(n2+s2)/2
/////////////////////////////////////////////////////////////////
//Draw the cube
//North wall
if n1<n2{
    draw_primitive_begin_texture(pr_trianglestrip,argument0)
        draw_vertex_texture(w2,n2,0,0)
        draw_vertex_texture(w1,n1,0,1)
        draw_vertex_texture(hmid,n2,0.5,0)
        draw_vertex_texture(e1,n1,1,1)
        draw_vertex_texture(e2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//South wall
if s1>s2{
    draw_primitive_begin_texture(pr_trianglestrip,argument0)
        draw_vertex_texture(w2,s2,0,0)
        draw_vertex_texture(w1,s1,0,1)
        draw_vertex_texture(hmid,s2,0.5,0)
        draw_vertex_texture(e1,s1,1,1)
        draw_vertex_texture(e2,s2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//West wall
if w1<w2{
    draw_primitive_begin_texture(pr_trianglestrip,argument0)
        draw_vertex_texture(w2,s2,0,0)
        draw_vertex_texture(w1,s1,0,1)
        draw_vertex_texture(w2,vmid,0.5,0)
        draw_vertex_texture(w1,n1,1,1)
        draw_vertex_texture(w2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//East wall
if e1>e2{
    draw_primitive_begin_texture(pr_trianglestrip,argument0)
        draw_vertex_texture(e2,s2,0,0)
        draw_vertex_texture(e1,s1,0,1)
        draw_vertex_texture(e2,vmid,0.5,0)
        draw_vertex_texture(e1,n1,1,1)
        draw_vertex_texture(e2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//Draw top
draw_primitive_begin_texture(pr_trianglestrip,argument0)  
    draw_vertex_texture(e2,n2,0,0)
    draw_vertex_texture(e2,s2,0,1)
    draw_vertex_texture(w2,n2,1,0)
    draw_vertex_texture(w2,s2,1,1)
draw_primitive_end()
#define w3d_draw_floor
/// w3d_draw_floor(texture,x,y,height,xsize,ysize)
/*
Draws a cube at (x,y,z)
The texture index must be sized a power of two! 
That means 2, 4, 8, 16, 32, 64, 128, 256, 512 and so on
This cube is always drawn with its base at (x,y,0), and top at (x,y,height).
If you want it to be drawn from (x,y,z1) to (x,y,z2), use draw_cube_ext

Script made by TheSnidr
www.thesnidr.com
*/
/////////////////////////////////////////////////////////////////
//Initiate variables
var z2,hor,ver,n1,s1,e1,w1,
xx,yy,scl,e2,w2,n2,s2,hmid,vmid;
/////////////////////////////////////////////////////////////////
//Find the actual z value and horizontal/vertical value of the top of the cube
z2=w3d_calculate_z(argument3)
hor=w3d_get_hor(argument1)
ver=w3d_get_ver(argument2)
argument4/=2 //Width
argument5/=2 //Height
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the bottom of the cube
e1=argument1+argument4
w1=argument1-argument4
n1=argument2-argument5
s1=argument2+argument5
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the top of the cube
xx=argument1-z2*hor
yy=argument2-z2*ver
scl=1+z2/500
e2=xx+(e1-argument1)*scl
w2=xx+(w1-argument1)*scl
n2=yy+(n1-argument2)*scl
s2=yy+(s1-argument2)*scl
/////////////////////////////////////////////////////////////////
//These variables are used when making the extra triangle
hmid=(e2+w2)/2
vmid=(n2+s2)/2
/////////////////////////////////////////////////////////////////
//Draw the floor
draw_primitive_begin_texture(pr_trianglestrip,argument0)  
    draw_vertex_texture(e2,n2,0,0)
    draw_vertex_texture(e2,s2,0,1)
    draw_vertex_texture(w2,n2,1,0)
    draw_vertex_texture(w2,s2,1,1)
draw_primitive_end()
#define w3d_draw_cube_ext
/// w3d_draw_cube(top_tex,side_tex,x,y,z,height,xsize,ysize)
/*
Draws a cube at (x,y,z)
The texture index must be sized a power of two! 
That means 2, 4, 8, 16, 32, 64, 128, 256, 512 and so on

Script made by TheSnidr
www.thesnidr.com
*/
/////////////////////////////////////////////////////////////////
//Initiate variables
var z1,z2,hor,ver,n,s,e,w,xx,yy,scl,
e1,w1,n1,s1,e2,w2,n2,s2,hmid,vmid;
/////////////////////////////////////////////////////////////////
//Find the actual z values and horizontal/vertical values of the top of the cube
z1=w3d_calculate_z(argument4)
z2=w3d_calculate_z(argument4+argument5)
hor=w3d_get_hor(argument2)
ver=w3d_get_ver(argument3)
argument6/=2 //Width
argument7/=2 //Height
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of a flat square
e=argument2+argument6-argument2
w=argument2-argument6-argument2
n=argument3-argument7-argument3
s=argument3+argument7-argument3
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the bottom of the cube
xx=argument2-z1*hor
yy=argument3-z1*ver
scl=1+z1/500
e1=xx+e*scl
w1=xx+w*scl
n1=yy+n*scl
s1=yy+s*scl
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the top of the cube
xx=argument2-z2*hor
yy=argument3-z2*ver
scl=1+z2/500
e2=xx+e*scl
w2=xx+w*scl
n2=yy+n*scl
s2=yy+s*scl
/////////////////////////////////////////////////////////////////
//These variables are used when making the extra triangle
hmid=(e2+w2)/2
vmid=(n2+s2)/2
/////////////////////////////////////////////////////////////////
//Draw the cube
//North wall
if n1<n2{
    draw_primitive_begin_texture(pr_trianglestrip,argument1)
        draw_vertex_texture(w2,n2,0,0)
        draw_vertex_texture(w1,n1,0,1)
        draw_vertex_texture(hmid,n2,0.5,0)
        draw_vertex_texture(e1,n1,1,1)
        draw_vertex_texture(e2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//South wall
if s1>s2{
    draw_primitive_begin_texture(pr_trianglestrip,argument1)
        draw_vertex_texture(w2,s2,0,0)
        draw_vertex_texture(w1,s1,0,1)
        draw_vertex_texture(hmid,s2,0.5,0)
        draw_vertex_texture(e1,s1,1,1)
        draw_vertex_texture(e2,s2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//West wall
if w1<w2{
    draw_primitive_begin_texture(pr_trianglestrip,argument1)
        draw_vertex_texture(w2,s2,0,0)
        draw_vertex_texture(w1,s1,0,1)
        draw_vertex_texture(w2,vmid,0.5,0)
        draw_vertex_texture(w1,n1,1,1)
        draw_vertex_texture(w2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//East wall
if e1>e2{
    draw_primitive_begin_texture(pr_trianglestrip,argument1)
        draw_vertex_texture(e2,s2,0,0)
        draw_vertex_texture(e1,s1,0,1)
        draw_vertex_texture(e2,vmid,0.5,0)
        draw_vertex_texture(e1,n1,1,1)
        draw_vertex_texture(e2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//Draw top
draw_primitive_begin_texture(pr_trianglestrip,argument0)  
    draw_vertex_texture(e2,n2,0,0)
    draw_vertex_texture(e2,s2,0,1)
    draw_vertex_texture(w2,n2,1,0)
    draw_vertex_texture(w2,s2,1,1)
draw_primitive_end()
#define w3d_draw_cube_tex
/// w3d_draw_cube_tex(top_tex,n_tex,s_tex,e_tex,w_text,x,y,z,height,xsize,ysize)
/*
Draws a cube at (x,y,z)
The texture indexes must be sized a power of two! 
That means 2, 4, 8, 16, 32, 64, 128, 256, 512 and so on
n_tex=north texture
s_tex=south texture
e_tex=east texture
w_tex=west texture

Script made by TheSnidr
www.thesnidr.com
*/
/////////////////////////////////////////////////////////////////
//Initiate variables
var z1,z2,hor,ver,n,s,e,w,xx,yy,scl,
e1,w1,n1,s1,e2,w2,n2,s2,hmid,vmid;
/////////////////////////////////////////////////////////////////
//Find the actual z values and horizontal/vertical values of the top of the cube
z1=w3d_calculate_z(argument7)
z2=w3d_calculate_z(argument7+argument8)
hor=w3d_get_hor(argument5)
ver=w3d_get_ver(argument6)
argument9/=2 //Width
argument10/=2 //Height
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of a flat square
e=argument5+argument9-argument5
w=argument5-argument9-argument5
n=argument6-argument10-argument6
s=argument6+argument10-argument6
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the bottom of the cube
xx=argument5-z1*hor
yy=argument6-z1*ver
scl=1+z1/500
e1=xx+e*scl
w1=xx+w*scl
n1=yy+n*scl
s1=yy+s*scl
/////////////////////////////////////////////////////////////////
//Find the coordinates for each corner of the top of the cube
xx=argument5-z2*hor
yy=argument6-z2*ver
scl=1+z2/500
e2=xx+e*scl
w2=xx+w*scl
n2=yy+n*scl
s2=yy+s*scl
/////////////////////////////////////////////////////////////////
//These variables are used when making the extra triangle
hmid=(e2+w2)/2
vmid=(n2+s2)/2
/////////////////////////////////////////////////////////////////
//Draw the cube
//North wall
if n1<n2{
    draw_primitive_begin_texture(pr_trianglestrip,argument1)
        draw_vertex_texture(w2,n2,0,0)
        draw_vertex_texture(w1,n1,0,1)
        draw_vertex_texture(hmid,n2,0.5,0)
        draw_vertex_texture(e1,n1,1,1)
        draw_vertex_texture(e2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//South wall
if s1>s2{
    draw_primitive_begin_texture(pr_trianglestrip,argument2)
        draw_vertex_texture(w2,s2,0,0)
        draw_vertex_texture(w1,s1,0,1)
        draw_vertex_texture(hmid,s2,0.5,0)
        draw_vertex_texture(e1,s1,1,1)
        draw_vertex_texture(e2,s2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//East wall
if e1>e2{
    draw_primitive_begin_texture(pr_trianglestrip,argument3)
        draw_vertex_texture(e2,s2,0,0)
        draw_vertex_texture(e1,s1,0,1)
        draw_vertex_texture(e2,vmid,0.5,0)
        draw_vertex_texture(e1,n1,1,1)
        draw_vertex_texture(e2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//West wall
if w1<w2{
    draw_primitive_begin_texture(pr_trianglestrip,argument4)
        draw_vertex_texture(w2,s2,0,0)
        draw_vertex_texture(w1,s1,0,1)
        draw_vertex_texture(w2,vmid,0.5,0)
        draw_vertex_texture(w1,n1,1,1)
        draw_vertex_texture(w2,n2,1,0)
    draw_primitive_end()}
/////////////////////////////////////////////////////////////////
//Draw top
draw_primitive_begin_texture(pr_trianglestrip,argument0)  
    draw_vertex_texture(e2,n2,0,0)
    draw_vertex_texture(e2,s2,0,1)
    draw_vertex_texture(w2,n2,1,0)
    draw_vertex_texture(w2,s2,1,1)
draw_primitive_end()
#define w3d_draw_cylinder
/*
w3d_draw_cylinder(texture_index,x,y,z,height,radius)
This script does not have an internal depth system,
meaning the walls will draw over each other wrongly.
If the internal depth is important for your use, 
use the w3d model scripts instead

Script made by TheSnidr
www.thesnidr.com
*/
var i,z1,z2,xx,yy,hor,ver,xtex;
z1=w3d_calculate_z(argument3)
z2=w3d_calculate_z(argument3+argument4)
draw_primitive_begin_texture(pr_trianglestrip,argument0)
for (i=-360/10;i<360;i+=360/10)
{
    xx=argument1+lengthdir_x(argument5,i)
    yy=argument2+lengthdir_y(argument5,i)
    hor=w3d_get_hor(xx)
    ver=w3d_get_ver(yy)
    xtex=i/360
    draw_vertex_texture(xx-z1*hor,yy-z1*ver,xtex,1)
    draw_vertex_texture(xx-z2*hor,yy-z2*ver,xtex,0)
}
draw_primitive_end()
#define w3d_draw_cylinder_ext
/*
w3d_draw_cylinder_ext(texture_index,x,y,z,height,radius,vertexes,xtex_left,ytex_top)
This script does not have an internal depth system,
meaning the walls will draw over each other wrongly.
If the internal depth is important for your use, 
use the w3d model scripts instead

Script made by TheSnidr
www.thesnidr.com
*/
var i,z1,z2,xx,yy,hor,ver,xtex;
z1=w3d_calculate_z(argument3)
z2=w3d_calculate_z(argument3+argument4)
texture_set_repeat(true)
draw_primitive_begin_texture(pr_trianglestrip,argument0)
for (i=-360/argument6;i<360;i+=360/argument6)
{
    xx=argument1+lengthdir_x(argument5,i)
    yy=argument2+lengthdir_y(argument5,i)
    hor=w3d_get_hor(xx)
    ver=w3d_get_ver(yy)
    xtex=argument7+i/360
    draw_vertex_texture(xx-z1*hor,yy-z1*ver,xtex,argument8+1)
    draw_vertex_texture(xx-z2*hor,yy-z2*ver,xtex,argument8)
}
draw_primitive_end()
#define w3d_draw_wall
/*
w3d_draw_wall(texture_index,x1,y1,x2,y2,height)
Draws a w3d wall from (x1,y1) to (x2,y2)
Requires a texture index
The texture must have a size the power of 2.
That means, 4, 8, 16, 32, 64, 128, 512, 1024 - and so on..

Script made by TheSnidr
www.thesnidr.com
*/

var hor1,ver1,hor2,ver2,scale,z2;

z2=w3d_calculate_z(argument5)

hor1=w3d_get_hor(argument1)
hor2=w3d_get_hor(argument3)
ver1=w3d_get_ver(argument2)
ver2=w3d_get_ver(argument4)

draw_primitive_begin_texture(pr_trianglestrip,argument0)
    draw_vertex_texture(argument1,argument2,0,1)
    draw_vertex_texture(argument1-(z2*hor1),argument2-(z2*ver1),0,0)
    draw_vertex_texture((argument1+argument3)/2,(argument2+argument4)/2,1/2,1)
    draw_vertex_texture(argument3-(z2*hor2),argument4-(z2*ver2),1,0)
    draw_vertex_texture(argument3,argument4,1,1)
draw_primitive_end()
#define w3d_draw_wall_ext
/*
w3d_draw_wall(texture_index,x1,y1,z1,x2,y2,z2)
Draws a w3d wall from (x1,y1) to (x2,y2)
Requires a texture index
The texture must have a size the power of 2.
That means, 4, 8, 16, 32, 64, 128, 512, 1024 - and so on..

Script made by TheSnidr
www.thesnidr.com
*/

var hor1,ver1,hor2,ver2,scale,z1,z2;

z1=w3d_calculate_z(argument3)
z2=w3d_calculate_z(argument6)

hor1=w3d_get_hor(argument1)
hor2=w3d_get_hor(argument4)
ver1=w3d_get_ver(argument2)
ver2=w3d_get_ver(argument5)
scale=1+z1/500

draw_primitive_begin_texture(pr_trianglestrip,argument0)
    draw_vertex_texture(argument1-(z1*hor1),argument2-(z1*ver1),0,1)
    draw_vertex_texture(argument1-(z2*hor1),argument2-(z2*ver1),0,0)
    draw_vertex_texture(argument1+((argument4-argument1)*scale)/2-(z1*hor1),argument2+((argument5-argument2)*scale)/2-(z1*ver1),1/2,1)
    draw_vertex_texture(argument4-(z2*hor2),argument5-(z2*ver2),1,0)
    draw_vertex_texture(argument4-(z1*hor2),argument5-(z1*ver2),1,1)
draw_primitive_end()
#define w3d_draw_vertex
/*
w3d_draw_vertex(x,y,z)
Adds a vertex to a primitive, from (x1,y1,z1) to (x2,y2,z2).

Script made by TheSnidr
www.thesnidr.com
*/

var z;
z=w3d_calculate_z(argument2)
draw_vertex(argument0-z*w3d_get_hor(argument0),argument1-z*w3d_get_ver(argument1))
#define w3d_draw_vertex_texture
/*
w3d_draw_vertex_texture(x,y,z,xtex,ytex)
Adds a vertex to the primitive, from (x1,y1,z1) to (x2,y2,z2).

Script made by TheSnidr
www.thesnidr.com
*/

var z;
z=w3d_calculate_z(argument2)
draw_vertex_texture(argument0-z*w3d_get_hor(argument0),argument1-z*w3d_get_ver(argument1),argument3,argument4)
#define w3d_draw_vertex_texture_color
/*
w3d_draw_vertex_texture(x,y,z,xtex,ytex,color,alpha)
Adds a vertex to the primitive, from (x1,y1,z1) to (x2,y2,z2).

Script made by TheSnidr
www.thesnidr.com
*/

var z;
z=w3d_calculate_z(argument2)
draw_vertex_texture_color(argument0-z*w3d_get_hor(argument0),argument1-z*w3d_get_ver(argument1),argument3,argument4,argument5,argument6)
#define w3d_draw_sprite
///w3d_draw_sprite(sprite_index,image_index,x,y,z)
/*
Draws a sprite at (x,y,z).

Script made by TheSnidr
www.thesnidr.com
*/
var scale,temp_z,xx,yy;
temp_z=w3d_calculate_z(argument4)
scale=1+temp_z/500
xx=argument2-temp_z*w3d_get_hor(argument2)
yy=argument3-temp_z*w3d_get_ver(argument3)

draw_sprite_ext(argument0,argument1,xx,yy,scale,scale,0,c_white,1)
#define w3d_draw_sprite_ext
/// w3d_draw_sprite_ext(sprite_index,image_index,x,y,z,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
/*
Draws a sprite at (x,y,z).

Script made by TheSnidr
www.thesnidr.com
*/
var scale,temp_z;
temp_z=w3d_calculate_z(argument4)
scale= (temp_z/500)
_hor=w3d_get_hor(argument2)
_ver=w3d_get_ver(argument3)

draw_sprite_ext(argument0,argument1,argument2-(temp_z*_hor),argument3-(temp_z*_ver),argument5+scale*argument5,argument6+scale*argument6,argument7,argument8,argument9)
#define w3d_depth
/*
depth=w3d_depth(x,y,additional_depth)
This calculates a natural depth for the instance.
You can also choose to give it additional depth, when the instance is,
for example, high above the rest.

The last argument should NOT be the variable "depth", as that will create a loop.

Script made by TheSnidr
www.thesnidr.com
*/

return (point_distance(view_xview+view_wview/2,view_yview+view_hview/2,argument0,argument1)/10)+argument2
#define w3d_path_position
/*
scr_path_position(ind,n)
Finds the position of point n in the path.
This script is made specifically for use with w3d_create_model, and
may not work as expected for other causes.

Script made by TheSnidr
www.thesnidr.com
*/
var nr,dist,i;
nr=path_get_number(argument0)
dist=0
for (i=1;i<min(argument1+1,nr);i+=1)
{
    dist+=point_distance(path_get_point_x(argument0,i),path_get_point_y(argument0,i),path_get_point_x(argument0,i-1),path_get_point_y(argument0,i-1))
}
return dist/path_get_length(argument0)
#define w3d_calculate_z
/*
w3d_calculate_z(z)
To make a better feel of 3d, this function should be used.
It is already implemented in the functions that needs it though.

Script made by TheSnidr
www.thesnidr.com
*/
if argument0<=0{return (-10*argument0)/(0.02*argument0-10) exit;}
return power(0.8*argument0,(0.0008*argument0+1))
#define w3d_get_x
/*
w3d_get_x(x,z)

Script made by TheSnidr
www.thesnidr.com
*/
return argument0-w3d_calculate_z(argument1)*w3d_get_hor(argument0)
#define w3d_get_y
/*
w3d_get_y(y,z)

Script made by TheSnidr
www.thesnidr.com
*/
return argument0-w3d_calculate_z(argument1)*w3d_get_ver(argument0)
#define w3d_get_hor
/*
w3d_get_hor(x)

Script made by TheSnidr
www.thesnidr.com
*/
return (view_xview+view_wview/2-argument0)/500
#define w3d_get_ver
/*
w3d_get_ver(y)

Script made by TheSnidr
www.thesnidr.com
*/
return (view_yview+view_hview/2-argument0)/500
