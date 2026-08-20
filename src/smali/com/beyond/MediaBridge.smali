.class public Lcom/beyond/MediaBridge;
.super Ljava/lang/Object;
.source "MediaBridge.java"


# static fields
.field private static final FILE_TYPE_3GPP:I = 0x17

.field private static final FILE_TYPE_3GPP2:I = 0x18

.field private static final FILE_TYPE_AMR:I = 0x4

.field private static final FILE_TYPE_AWB:I = 0x5

.field private static final FILE_TYPE_BMP:I = 0x22

.field private static final FILE_TYPE_GIF:I = 0x20

.field private static final FILE_TYPE_IMY:I = 0xd

.field private static final FILE_TYPE_JPEG:I = 0x1f

.field private static final FILE_TYPE_M3U:I = 0x29

.field private static final FILE_TYPE_M4A:I = 0x2

.field private static final FILE_TYPE_M4V:I = 0x16

.field private static final FILE_TYPE_MID:I = 0xb

.field private static final FILE_TYPE_MMF:I = 0xe

.field private static final FILE_TYPE_MP3:I = 0x1

.field private static final FILE_TYPE_MP4:I = 0x15

.field private static final FILE_TYPE_OGG:I = 0x7

.field private static final FILE_TYPE_PLS:I = 0x2a

.field private static final FILE_TYPE_PNG:I = 0x21

.field private static final FILE_TYPE_SMF:I = 0xc

.field private static final FILE_TYPE_WAV:I = 0x3

.field private static final FILE_TYPE_WBMP:I = 0x23

.field private static final FILE_TYPE_WMA:I = 0x6

.field private static final FILE_TYPE_WMV:I = 0x19

.field private static final FILE_TYPE_WPL:I = 0x2b

.field private static PlayerMap:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final VOLTYPE_ALARM:I = 0x5

.field public static final VOLTYPE_ALERT:I = 0x6

.field public static final VOLTYPE_KEYTONE:I = 0x3

.field public static final VOLTYPE_MESSAGE:I = 0x4

.field public static final VOLTYPE_MMEDIA:I = 0x7

.field public static final VOLTYPE_RECORDER:I = 0x1

.field public static final VOLTYPE_RING:I = 0x2

.field public static final VOLTYPE_SOUND:I = 0x7

.field public static final VOLTYPE_TONE:I = 0x3

.field public static final VOLTYPE_VOICE:I = 0x1

.field private static mediaFileName:Ljava/lang/String;

.field private static sMimeTypeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sMimeTypes:Ljava/lang/String;

.field private static soundPool:Landroid/media/SoundPool;

.field private static soundPoolMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static volum_onoff_mode:Z


# instance fields
.field protected buf:[B

.field protected bufLength:I

.field protected devID:I

.field protected duration:[I

.field protected event:I

.field protected eventParm:I

.field private fd:Ljava/io/FileDescriptor;

.field protected filePath:Ljava/lang/String;

.field protected front:I

.field protected hiFreq:[I

.field protected isFile:Z

.field protected isNotifyWM:Z

.field protected isRepeat:I

.field protected left:I

.field protected lowFreq:[I

.field protected magicID:I

.field protected mediaFile:Ljava/io/File;

.field private mp:Landroid/media/MediaPlayer;

.field protected play_listener:Ljava/lang/Object;

.field protected playerID:I

.field protected prgID:I

.field private raw_resource_id:I

.field protected rear:I

.field protected regionID:I

.field private resourceName:Ljava/lang/String;

.field private soundID:I

.field protected startLeft:I

.field private streamID:I

.field protected tone:[I

.field protected type:Ljava/lang/String;

.field protected waterMarkLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 198
    sput-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    .line 202
    sput-object v0, Lcom/beyond/MediaBridge;->sMimeTypes:Ljava/lang/String;

    .line 204
    const-string v0, "media"

    sput-object v0, Lcom/beyond/MediaBridge;->mediaFileName:Ljava/lang/String;

    .line 208
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 207
    sput-object v0, Lcom/beyond/MediaBridge;->sMimeTypeMap:Ljava/util/HashMap;

    .line 216
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 215
    sput-object v0, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    .line 518
    const/4 v0, 0x0

    sput-boolean v0, Lcom/beyond/MediaBridge;->volum_onoff_mode:Z

    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput v1, p0, Lcom/beyond/MediaBridge;->playerID:I

    .line 122
    iput v0, p0, Lcom/beyond/MediaBridge;->left:I

    .line 127
    iput v0, p0, Lcom/beyond/MediaBridge;->front:I

    .line 132
    iput v0, p0, Lcom/beyond/MediaBridge;->rear:I

    .line 137
    iput v0, p0, Lcom/beyond/MediaBridge;->waterMarkLength:I

    .line 142
    iput-boolean v0, p0, Lcom/beyond/MediaBridge;->isNotifyWM:Z

    .line 167
    iput v1, p0, Lcom/beyond/MediaBridge;->event:I

    .line 172
    iput v1, p0, Lcom/beyond/MediaBridge;->devID:I

    .line 194
    iput-object v2, p0, Lcom/beyond/MediaBridge;->fd:Ljava/io/FileDescriptor;

    .line 195
    iput-object v2, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    .line 196
    iput-object v2, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    .line 199
    iput v1, p0, Lcom/beyond/MediaBridge;->soundID:I

    .line 200
    iput v1, p0, Lcom/beyond/MediaBridge;->streamID:I

    .line 205
    iput-object v2, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    .line 213
    iput v0, p0, Lcom/beyond/MediaBridge;->raw_resource_id:I

    .line 21
    return-void
.end method

.method private static addFileType(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .param p0, "extension"    # Ljava/lang/String;
    .param p1, "fileType"    # I
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 712
    sget-object v0, Lcom/beyond/MediaBridge;->sMimeTypeMap:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    return-void
.end method

.method protected static control0(IILjava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p0, "playerID"    # I
    .param p1, "cmd"    # I
    .param p2, "buf1"    # Ljava/lang/Object;
    .param p3, "buf2"    # Ljava/lang/Object;

    .prologue
    .line 449
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 450
    const/4 v0, 0x0

    return v0
.end method

.method public static createSoundPool([Ljava/lang/String;)Z
    .locals 14
    .param p0, "resNames"    # [Ljava/lang/String;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 667
    new-instance v0, Landroid/media/SoundPool;

    array-length v1, p0

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v12}, Landroid/media/SoundPool;-><init>(III)V

    sput-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    .line 668
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/beyond/MediaBridge;->soundPoolMap:Ljava/util/HashMap;

    .line 670
    if-eqz p0, :cond_0

    .line 671
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    array-length v0, p0

    if-lt v9, v0, :cond_1

    .end local v9    # "i":I
    :cond_0
    move v0, v13

    .line 683
    :goto_1
    return v0

    .line 673
    .restart local v9    # "i":I
    :cond_1
    :try_start_0
    aget-object v10, p0, v9

    .line 674
    .local v10, "name":Ljava/lang/String;
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    .line 675
    .local v7, "afd":Landroid/content/res/AssetFileDescriptor;
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->load(Ljava/io/FileDescriptor;JJI)I

    move-result v11

    .line 676
    .local v11, "soundid":I
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 677
    sget-object v0, Lcom/beyond/MediaBridge;->soundPoolMap:Ljava/util/HashMap;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 671
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 678
    .end local v7    # "afd":Landroid/content/res/AssetFileDescriptor;
    .end local v10    # "name":Ljava/lang/String;
    .end local v11    # "soundid":I
    :catch_0
    move-exception v8

    .local v8, "e":Ljava/io/IOException;
    move v0, v12

    .line 679
    goto :goto_1
.end method

.method static event2Clip(II)Lcom/beyond/MediaBridge;
    .locals 3
    .param p0, "event"    # I
    .param p1, "magicID"    # I

    .prologue
    .line 425
    sget-object v1, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/MediaBridge;

    .line 426
    .local v0, "bcb":Lcom/beyond/MediaBridge;
    return-object v0
.end method

.method public static freeSoundPool()V
    .locals 1

    .prologue
    .line 687
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 688
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 689
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    .line 691
    :cond_0
    return-void
.end method

.method private static getAndroidStreamType(I)I
    .locals 1
    .param p0, "type"    # I

    .prologue
    const/4 v0, 0x3

    .line 693
    packed-switch p0, :pswitch_data_0

    .line 708
    const/4 v0, 0x1

    :goto_0
    :pswitch_0
    return v0

    .line 697
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 699
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 706
    :pswitch_3
    const/4 v0, 0x4

    goto :goto_0

    .line 693
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method private static getAudioManager()Landroid/media/AudioManager;
    .locals 3

    .prologue
    .line 716
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 717
    .local v0, "am":Landroid/media/AudioManager;
    return-object v0
.end method

.method static getAvailableDevices()Ljava/lang/String;
    .locals 1

    .prologue
    .line 744
    invoke-static {}, Lcom/beyond/MediaBridge;->init_mimeType()V

    .line 745
    sget-object v0, Lcom/beyond/MediaBridge;->sMimeTypes:Ljava/lang/String;

    return-object v0
.end method

.method public static getDefaultVolume0(I)I
    .locals 4
    .param p0, "volType"    # I

    .prologue
    .line 661
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 662
    .local v0, "am":Landroid/media/AudioManager;
    invoke-static {p0}, Lcom/beyond/MediaBridge;->getAndroidStreamType(I)I

    move-result v1

    .line 663
    .local v1, "streamType":I
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    div-int/2addr v2, v3

    return v2
.end method

.method private getFreePlayerId()I
    .locals 3

    .prologue
    .line 342
    sget-object v1, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 343
    const/4 v0, 0x1

    .line 350
    :cond_0
    return v0

    .line 345
    :cond_1
    const/4 v0, 0x1

    .line 346
    .local v0, "i":I
    const/4 v0, 0x1

    :goto_0
    sget-object v1, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    if-gt v0, v1, :cond_0

    .line 347
    sget-object v1, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 346
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static getMute0(I)Z
    .locals 5
    .param p0, "volType"    # I

    .prologue
    .line 642
    :try_start_0
    sget-object v4, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 643
    .local v0, "cr":Landroid/content/ContentResolver;
    const-string v4, "mute_streams_affected"

    invoke-static {v0, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v2

    .line 644
    .local v2, "ret":I
    invoke-static {p0}, Lcom/beyond/MediaBridge;->getAndroidStreamType(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 645
    .local v3, "streamType":I
    and-int v4, v2, v3

    if-ne v4, v3, :cond_0

    .line 646
    const/4 v4, 0x1

    .line 650
    .end local v0    # "cr":Landroid/content/ContentResolver;
    .end local v2    # "ret":I
    .end local v3    # "streamType":I
    :goto_0
    return v4

    .line 647
    :catch_0
    move-exception v1

    .line 648
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 650
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private static init_mimeType()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    .line 723
    sget-object v2, Lcom/beyond/MediaBridge;->sMimeTypeMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 724
    const-string v2, "MP3"

    const/4 v3, 0x1

    const-string v4, "audio/MP3"

    invoke-static {v2, v3, v4}, Lcom/beyond/MediaBridge;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    .line 725
    const-string v2, "WAV"

    const-string v3, "audio/WAVE"

    invoke-static {v2, v5, v3}, Lcom/beyond/MediaBridge;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    .line 726
    const-string v2, "MIDI"

    const-string v3, "audio/midi"

    invoke-static {v2, v5, v3}, Lcom/beyond/MediaBridge;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    .line 727
    const-string v2, "OGG"

    const/4 v3, 0x7

    const-string v4, "audio/OGG"

    invoke-static {v2, v3, v4}, Lcom/beyond/MediaBridge;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    .line 730
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 731
    .local v0, "builder":Ljava/lang/StringBuilder;
    sget-object v2, Lcom/beyond/MediaBridge;->sMimeTypeMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 733
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 739
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/beyond/MediaBridge;->sMimeTypes:Ljava/lang/String;

    .line 741
    :cond_0
    return-void

    .line 734
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 735
    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 737
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method protected static mediaInfo0(Ljava/lang/Object;I)Z
    .locals 1
    .param p0, "type"    # Ljava/lang/Object;
    .param p1, "mdaInfo"    # I

    .prologue
    .line 469
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 470
    const/4 v0, 0x0

    return v0
.end method

.method private static noti()V
    .locals 2

    .prologue
    .line 219
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "MediaBridge.noti"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 220
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "not Implemented class !!!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static pause0(Lcom/beyond/MediaBridge;)I
    .locals 2
    .param p0, "clip"    # Lcom/beyond/MediaBridge;

    .prologue
    .line 563
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 564
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 567
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 565
    :cond_1
    iget v0, p0, Lcom/beyond/MediaBridge;->streamID:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 566
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/beyond/MediaBridge;->streamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->pause(I)V

    goto :goto_0
.end method

.method public static play0(Lcom/beyond/MediaBridge;Z)I
    .locals 1
    .param p0, "clip"    # Lcom/beyond/MediaBridge;
    .param p1, "isRepeat"    # Z

    .prologue
    .line 596
    const/4 v0, 0x0

    return v0
.end method

.method public static record0(Lcom/beyond/MediaBridge;)I
    .locals 1
    .param p0, "clip"    # Lcom/beyond/MediaBridge;

    .prologue
    .line 600
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 601
    const/4 v0, 0x0

    return v0
.end method

.method public static resume0(Lcom/beyond/MediaBridge;)I
    .locals 2
    .param p0, "clip"    # Lcom/beyond/MediaBridge;

    .prologue
    .line 585
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 586
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 590
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 587
    :cond_1
    iget v0, p0, Lcom/beyond/MediaBridge;->streamID:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 588
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/beyond/MediaBridge;->streamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->resume(I)V

    goto :goto_0
.end method

.method public static setDefaultVolume0(II)Z
    .locals 4
    .param p0, "volType"    # I
    .param p1, "level"    # I

    .prologue
    const/4 v3, 0x0

    .line 654
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 655
    .local v0, "am":Landroid/media/AudioManager;
    invoke-static {p0}, Lcom/beyond/MediaBridge;->getAndroidStreamType(I)I

    move-result v1

    .line 656
    .local v1, "streamType":I
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v2

    mul-int/2addr v2, p1

    div-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 657
    return v3
.end method

.method public static setMute0(IZ)V
    .locals 2
    .param p0, "volType"    # I
    .param p1, "mute"    # Z

    .prologue
    .line 635
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 636
    .local v0, "am":Landroid/media/AudioManager;
    invoke-static {p0}, Lcom/beyond/MediaBridge;->getAndroidStreamType(I)I

    move-result v1

    .line 637
    .local v1, "streamType":I
    invoke-virtual {v0, v1, p1}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 638
    return-void
.end method

.method public static stop0(Lcom/beyond/MediaBridge;)I
    .locals 3
    .param p0, "clip"    # Lcom/beyond/MediaBridge;

    .prologue
    const/4 v2, 0x0

    .line 571
    iget v0, p0, Lcom/beyond/MediaBridge;->soundID:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 572
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/beyond/MediaBridge;->streamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 574
    :cond_0
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    if-nez v0, :cond_1

    .line 581
    :goto_0
    return v2

    .line 577
    :cond_1
    invoke-virtual {p0}, Lcom/beyond/MediaBridge;->freePlayer0()I

    goto :goto_0
.end method

.method public static vibrator_on(II)V
    .locals 3
    .param p0, "level"    # I
    .param p1, "duration"    # I

    .prologue
    .line 609
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    .line 610
    const-string v2, "vibrator"

    .line 609
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 611
    .local v0, "vib":Landroid/os/Vibrator;
    if-nez p0, :cond_0

    if-nez p1, :cond_0

    .line 612
    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 615
    :goto_0
    return-void

    .line 614
    :cond_0
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    goto :goto_0
.end method

.method public static volume_get()I
    .locals 4

    .prologue
    .line 623
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 624
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v1, 0x1

    .line 625
    .local v1, "streamType":I
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    div-int/2addr v2, v3

    return v2
.end method

.method public static volume_set(I)V
    .locals 4
    .param p0, "level"    # I

    .prologue
    .line 629
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 630
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v1, 0x1

    .line 631
    .local v1, "streamType":I
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v2

    mul-int/2addr v2, p0

    div-int/lit8 v2, v2, 0x64

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 632
    return-void
.end method


# virtual methods
.method protected allocMPPlayer0(Ljava/lang/String;)I
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 360
    invoke-virtual {p0, p1}, Lcom/beyond/MediaBridge;->allocPlayer0(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected allocPlayer0(Ljava/lang/String;)I
    .locals 10
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 364
    iget-object v0, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/beyond/MediaBridge;->buf:[B

    if-eqz v2, :cond_2

    move v2, v1

    :goto_1
    and-int/2addr v0, v2

    if-eqz v0, :cond_0

    .line 365
    invoke-virtual {p0}, Lcom/beyond/MediaBridge;->writeSndFile()V

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 368
    iget v0, p0, Lcom/beyond/MediaBridge;->soundID:I

    if-eq v0, v9, :cond_3

    .line 369
    invoke-direct {p0}, Lcom/beyond/MediaBridge;->getFreePlayerId()I

    move-result v0

    iput v0, p0, Lcom/beyond/MediaBridge;->playerID:I

    .line 370
    sget-object v0, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    iget v1, p0, Lcom/beyond/MediaBridge;->playerID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    :goto_2
    return v8

    :cond_1
    move v0, v8

    .line 364
    goto :goto_0

    :cond_2
    move v2, v8

    goto :goto_1

    .line 374
    :cond_3
    iget-object v0, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x2f

    if-ne v0, v2, :cond_4

    .line 375
    iget-object v0, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    .line 392
    :cond_4
    :try_start_0
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 393
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    .line 394
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 395
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 419
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :goto_3
    invoke-direct {p0}, Lcom/beyond/MediaBridge;->getFreePlayerId()I

    move-result v0

    iput v0, p0, Lcom/beyond/MediaBridge;->playerID:I

    .line 420
    sget-object v0, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    iget v1, p0, Lcom/beyond/MediaBridge;->playerID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 397
    :catch_0
    move-exception v7

    .line 398
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    move v8, v9

    .line 399
    goto :goto_2

    .line 402
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_5
    iget-object v0, p0, Lcom/beyond/MediaBridge;->fd:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_6

    .line 404
    :try_start_1
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    .line 405
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/beyond/MediaBridge;->fd:Ljava/io/FileDescriptor;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 407
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 409
    :catch_1
    move-exception v7

    .line 410
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    move v8, v9

    .line 411
    goto :goto_2

    .line 415
    .end local v7    # "e":Ljava/io/IOException;
    :cond_6
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "not support buffer"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 416
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    move v8, v9

    .line 417
    goto/16 :goto_2
.end method

.method protected checkCameraType(Ljava/lang/String;)I
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 270
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 271
    const/4 v0, 0x0

    return v0
.end method

.method protected checkClipType(Ljava/lang/String;)I
    .locals 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 258
    const/4 v1, -0x1

    .line 260
    .local v1, "val":I
    :try_start_0
    invoke-static {}, Lcom/beyond/MediaBridge;->init_mimeType()V

    .line 261
    sget-object v2, Lcom/beyond/MediaBridge;->sMimeTypeMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    move v2, v1

    .line 266
    :goto_0
    return v2

    .line 262
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 264
    const/4 v2, -0x1

    goto :goto_0
.end method

.method protected freePlayer0()I
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 430
    iget v1, p0, Lcom/beyond/MediaBridge;->playerID:I

    if-ne v1, v3, :cond_1

    .line 445
    :cond_0
    :goto_0
    return v4

    .line 433
    :cond_1
    sget-object v1, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    iget v2, p0, Lcom/beyond/MediaBridge;->playerID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/MediaBridge;

    .line 438
    .local v0, "bcb":Lcom/beyond/MediaBridge;
    iget-object v1, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 439
    iput-object v5, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    .line 440
    sget-object v1, Lcom/beyond/MediaBridge;->PlayerMap:Ljava/util/HashMap;

    iget v2, p0, Lcom/beyond/MediaBridge;->playerID:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    iput v3, p0, Lcom/beyond/MediaBridge;->playerID:I

    .line 442
    iget-object v1, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 443
    iput-object v5, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    goto :goto_0
.end method

.method protected getData0([BII)I
    .locals 1
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 337
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 338
    const/4 v0, 0x0

    return v0
.end method

.method protected getDuration0()I
    .locals 1

    .prologue
    .line 545
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 546
    const/4 v0, 0x0

    return v0
.end method

.method public getPlayerId()I
    .locals 1

    .prologue
    .line 224
    iget v0, p0, Lcom/beyond/MediaBridge;->playerID:I

    return v0
.end method

.method protected getPosition0()I
    .locals 1

    .prologue
    .line 499
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 500
    const/4 v0, 0x0

    return v0
.end method

.method protected getStopTime0()I
    .locals 1

    .prologue
    .line 540
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 541
    const/4 v0, 0x0

    return v0
.end method

.method protected getVolume()I
    .locals 4

    .prologue
    .line 506
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 507
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v1, 0x3

    .line 511
    .local v1, "streamType":I
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    div-int/2addr v2, v3

    return v2
.end method

.method protected mediaControl0(ILjava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "cmd"    # I
    .param p2, "buf1"    # Ljava/lang/Object;
    .param p3, "buf2"    # Ljava/lang/Object;

    .prologue
    .line 454
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 455
    const/4 v0, 0x0

    return v0
.end method

.method protected mediaDeviceControl0(ILjava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "cmd"    # I
    .param p2, "buf1"    # Ljava/lang/Object;
    .param p3, "buf2"    # Ljava/lang/Object;

    .prologue
    .line 464
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 465
    const/4 v0, 0x0

    return v0
.end method

.method protected mediaModeControl0(Ljava/lang/String;IILjava/lang/Object;)I
    .locals 1
    .param p1, "modeName"    # Ljava/lang/String;
    .param p2, "cmd"    # I
    .param p3, "pID"    # I
    .param p4, "buf"    # Ljava/lang/Object;

    .prologue
    .line 459
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 460
    const/4 v0, 0x0

    return v0
.end method

.method protected mediaReadData()I
    .locals 1

    .prologue
    .line 327
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 328
    const/4 v0, 0x0

    return v0
.end method

.method protected mediaWriteData()I
    .locals 8

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x0

    const/4 v7, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    .line 310
    iget v0, p0, Lcom/beyond/MediaBridge;->soundID:I

    if-eq v0, v5, :cond_1

    .line 311
    iget v0, p0, Lcom/beyond/MediaBridge;->isRepeat:I

    if-ne v0, v7, :cond_0

    .line 312
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/beyond/MediaBridge;->soundID:I

    move v3, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lcom/beyond/MediaBridge;->streamID:I

    .line 323
    :goto_0
    return v7

    .line 314
    :cond_0
    sget-object v0, Lcom/beyond/MediaBridge;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lcom/beyond/MediaBridge;->soundID:I

    move v3, v2

    move v5, v4

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lcom/beyond/MediaBridge;->streamID:I

    goto :goto_0

    .line 317
    :cond_1
    iget v0, p0, Lcom/beyond/MediaBridge;->isRepeat:I

    if-ne v0, v7, :cond_2

    .line 318
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v7}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 321
    :goto_1
    invoke-virtual {p0}, Lcom/beyond/MediaBridge;->setMPListenerComplete()V

    .line 322
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0

    .line 320
    :cond_2
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v4}, Landroid/media/MediaPlayer;->setLooping(Z)V

    goto :goto_1
.end method

.method protected putData0([BII)I
    .locals 1
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 332
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 333
    const/4 v0, 0x0

    return v0
.end method

.method public setFileName(Ljava/lang/String;I)Z
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "flag"    # I

    .prologue
    const/4 v2, 0x0

    .line 475
    :try_start_0
    invoke-static {p1, p2}, Lcom/beyond/FileBridge;->getFileDescriptor(Ljava/lang/String;I)Ljava/io/FileDescriptor;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/MediaBridge;->fd:Ljava/io/FileDescriptor;

    .line 477
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 484
    :goto_0
    return v2

    .line 479
    :catch_0
    move-exception v0

    .line 480
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected setMPListenerComplete()V
    .locals 2

    .prologue
    .line 275
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/beyond/MediaBridge$1;

    invoke-direct {v1, p0}, Lcom/beyond/MediaBridge$1;-><init>(Lcom/beyond/MediaBridge;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 288
    return-void
.end method

.method protected setPosition0(I)I
    .locals 1
    .param p1, "msec"    # I

    .prologue
    .line 550
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 551
    iget-object v0, p0, Lcom/beyond/MediaBridge;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 552
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected setResouce(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "resourceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 228
    iput-object p1, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    .line 229
    sget-object v1, Lcom/beyond/MediaBridge;->soundPoolMap:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 230
    sget-object v1, Lcom/beyond/MediaBridge;->soundPoolMap:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 231
    sget-object v1, Lcom/beyond/MediaBridge;->soundPoolMap:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/beyond/MediaBridge;->soundID:I

    .line 233
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "resource:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/kwis/msf/io/URL;->find(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v0

    check-cast v0, Lcom/beyond/io/SocketModel;

    .line 234
    .local v0, "soc":Lcom/beyond/io/SocketModel;
    invoke-virtual {v0}, Lcom/beyond/io/SocketModel;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method protected setStopTime0(I)I
    .locals 1
    .param p1, "ms"    # I

    .prologue
    .line 535
    invoke-static {}, Lcom/beyond/MediaBridge;->noti()V

    .line 536
    const/4 v0, 0x0

    return v0
.end method

.method protected setVolume(I)Z
    .locals 4
    .param p1, "level"    # I

    .prologue
    const/4 v3, 0x0

    .line 521
    invoke-static {}, Lcom/beyond/MediaBridge;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 522
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v1, 0x3

    .line 527
    .local v1, "streamType":I
    if-lez p1, :cond_0

    sget-boolean v2, Lcom/beyond/MediaBridge;->volum_onoff_mode:Z

    if-eqz v2, :cond_0

    .line 528
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 531
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 530
    :cond_0
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v2

    mul-int/2addr v2, p1

    div-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    goto :goto_0
.end method

.method protected writeSndFile()V
    .locals 6

    .prologue
    .line 240
    :try_start_0
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    sget-object v5, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/beyond/MediaBridge;->mediaFileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    .line 241
    iget-object v3, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->deleteOnExit()V

    .line 242
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 243
    .local v2, "outStream":Ljava/io/FileOutputStream;
    iget-object v3, p0, Lcom/beyond/MediaBridge;->buf:[B

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/beyond/MediaBridge;->buf:[B

    array-length v5, v5

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/FileOutputStream;->write([BII)V

    .line 244
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 245
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v3, p0, Lcom/beyond/MediaBridge;->mediaFile:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 246
    .local v1, "inbuf":Ljava/io/FileInputStream;
    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/MediaBridge;->fd:Ljava/io/FileDescriptor;

    .line 247
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/beyond/MediaBridge;->resourceName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    .end local v1    # "inbuf":Ljava/io/FileInputStream;
    .end local v2    # "outStream":Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 248
    :catch_0
    move-exception v0

    .line 250
    .local v0, "e1":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
