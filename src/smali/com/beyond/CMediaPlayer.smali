.class Lcom/beyond/CMediaPlayer;
.super Ljava/lang/Object;
.source "CletActivity.java"


# static fields
.field private static final MC_MDA_STATUS_END_OF_DATA:I = 0x1

.field private static final MC_MDA_STATUS_END_OF_MEDIA:I = 0xa

.field private static final MC_MDA_STATUS_ERROR:I = -0x1

.field private static final MC_MDA_STATUS_FILENOSPACE:I = 0x8

.field private static final MC_MDA_STATUS_FULL_OF_DATA:I = 0x7

.field private static final MC_MDA_STATUS_OEM_ERROR:I = 0x9

.field private static final MC_MDA_STATUS_PAUSE:I = 0x4

.field private static final MC_MDA_STATUS_RECORD:I = 0x6

.field private static final MC_MDA_STATUS_RESUME:I = 0x5

.field private static final MC_MDA_STATUS_START:I = 0x2

.field private static final MC_MDA_STATUS_STOP:I = 0x3

.field private static final MC_MDA_STATUS_STOPPED_AT_TIME:I = 0xb


# instance fields
.field private appTh:Lcom/beyond/AppThread;

.field private cachedir:Ljava/io/File;

.field private mediaFile:Ljava/io/File;

.field private mediaID:I

.field private mp:Landroid/media/MediaPlayer;

.field private mrepeate:Z

.field private soundid:I


# direct methods
.method public constructor <init>(Ljava/io/File;ILcom/beyond/AppThread;)V
    .locals 1
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "id"    # I
    .param p3, "appTh"    # Lcom/beyond/AppThread;

    .prologue
    .line 895
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 892
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/CMediaPlayer;->mrepeate:Z

    .line 893
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    .line 896
    iput-object p1, p0, Lcom/beyond/CMediaPlayer;->cachedir:Ljava/io/File;

    .line 897
    iput-object p3, p0, Lcom/beyond/CMediaPlayer;->appTh:Lcom/beyond/AppThread;

    .line 898
    iput p2, p0, Lcom/beyond/CMediaPlayer;->mediaID:I

    .line 899
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/CMediaPlayer;->soundid:I

    .line 900
    return-void
.end method

.method static synthetic access$0(Lcom/beyond/CMediaPlayer;)Lcom/beyond/AppThread;
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->appTh:Lcom/beyond/AppThread;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 991
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 992
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 993
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/CMediaPlayer;->mediaFile:Ljava/io/File;

    .line 994
    return-void
.end method

.method public play()V
    .locals 3

    .prologue
    .line 964
    iget v0, p0, Lcom/beyond/CMediaPlayer;->soundid:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 965
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 978
    :goto_0
    return-void

    .line 967
    :cond_0
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/beyond/CMediaPlayer$1;

    invoke-direct {v1, p0}, Lcom/beyond/CMediaPlayer$1;-><init>(Lcom/beyond/CMediaPlayer;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 974
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0

    .line 976
    :cond_1
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->appTh:Lcom/beyond/AppThread;

    iget v1, p0, Lcom/beyond/CMediaPlayer;->soundid:I

    iget-boolean v2, p0, Lcom/beyond/CMediaPlayer;->mrepeate:Z

    invoke-virtual {v0, v1, v2}, Lcom/beyond/AppThread;->playSoundMap(IZ)V

    goto :goto_0
.end method

.method public setres(Ljava/lang/String;Z)V
    .locals 11
    .param p1, "resName"    # Ljava/lang/String;
    .param p2, "repeate"    # Z

    .prologue
    const/4 v2, 0x1

    .line 927
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_0

    .line 928
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 930
    :cond_0
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p1}, Lcom/beyond/AppThread;->getSoundMapKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 933
    :try_start_0
    const-string v0, "sdcard/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 934
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 935
    .local v10, "myfile":Ljava/io/File;
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 936
    .local v9, "inbuf":Ljava/io/FileInputStream;
    invoke-virtual {v9}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v8

    .line 938
    .local v8, "fd":Ljava/io/FileDescriptor;
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    .line 939
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v8}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 940
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 941
    if-eqz p2, :cond_1

    .line 942
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 960
    .end local v8    # "fd":Ljava/io/FileDescriptor;
    .end local v9    # "inbuf":Ljava/io/FileInputStream;
    .end local v10    # "myfile":Ljava/io/File;
    :cond_1
    :goto_0
    return-void

    .line 945
    :cond_2
    sget-object v0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 946
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    .line 947
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 948
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 949
    if-eqz p2, :cond_3

    .line 950
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 951
    :cond_3
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 954
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :catch_0
    move-exception v7

    .line 955
    .local v7, "e":Ljava/io/IOException;
    goto :goto_0

    .line 958
    .end local v7    # "e":Ljava/io/IOException;
    :cond_4
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p1}, Lcom/beyond/AppThread;->getSoundMapID(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/CMediaPlayer;->soundid:I

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 980
    iget v0, p0, Lcom/beyond/CMediaPlayer;->soundid:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 981
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 988
    :goto_0
    return-void

    .line 983
    :cond_0
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 984
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    goto :goto_0

    .line 986
    :cond_1
    iget-object v0, p0, Lcom/beyond/CMediaPlayer;->appTh:Lcom/beyond/AppThread;

    iget v1, p0, Lcom/beyond/CMediaPlayer;->soundid:I

    invoke-virtual {v0, v1}, Lcom/beyond/AppThread;->stopSoundMap(I)V

    goto :goto_0
.end method

.method public wirtedata([BZ)V
    .locals 6
    .param p1, "data"    # [B
    .param p2, "repeate"    # Z

    .prologue
    .line 906
    :try_start_0
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v3, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    .line 907
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/beyond/CMediaPlayer;->cachedir:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/Media_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/beyond/CMediaPlayer;->mediaID:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/beyond/CMediaPlayer;->mediaFile:Ljava/io/File;

    .line 908
    iget-object v3, p0, Lcom/beyond/CMediaPlayer;->mediaFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->deleteOnExit()V

    .line 909
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/beyond/CMediaPlayer;->mediaFile:Ljava/io/File;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 910
    .local v2, "outStream":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    array-length v4, p1

    invoke-virtual {v2, p1, v3, v4}, Ljava/io/FileOutputStream;->write([BII)V

    .line 911
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 912
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v3, p0, Lcom/beyond/CMediaPlayer;->mediaFile:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 913
    .local v1, "inbuf":Ljava/io/FileInputStream;
    iget-object v3, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 914
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 915
    if-eqz p2, :cond_0

    .line 916
    iget-object v3, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 917
    :cond_0
    iget-object v3, p0, Lcom/beyond/CMediaPlayer;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 921
    .end local v1    # "inbuf":Ljava/io/FileInputStream;
    .end local v2    # "outStream":Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 918
    :catch_0
    move-exception v0

    .line 919
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method
