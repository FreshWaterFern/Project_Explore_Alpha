/// scr_loadgame_menu(index)
switch(argument0)
{
    case 0:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    m_control = false;
    obj_menu_start.m_control = true;
    instance_destroy();
    break;
    }
    
    case 1:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[1];
    var buff1 = buffer_load(m_str[1]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 2:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[2];
    var buff1 = buffer_load(m_str[2]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 3:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[3];
    var buff1 = buffer_load(m_str[3]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 4:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[4];
    var buff1 = buffer_load(m_str[4]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 5:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[5];
    var buff1 = buffer_load(m_str[5]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 6:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[6];
    var buff1 = buffer_load(m_str[6]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 7:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[7];
    var buff1 = buffer_load(m_str[7]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 8:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[8];
    var buff1 = buffer_load(m_str[8]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 9:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[9];
    var buff1 = buffer_load(m_str[9]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
    
    case 10:
    {
    audio_play_sound(snd_click01,4,false);
    io_clear();
    global.save_loading = true;
    global.world_name = m_str[10];
    var buff1 = buffer_load(m_str[10]);
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    room_set_width(room_world_editor,buffer_read(buff1,buffer_u32));
    buffer_delete(buff1);
    room_goto(room_world_editor);
    break;
    }
}
