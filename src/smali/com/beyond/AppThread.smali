.class Lcom/beyond/AppThread;
.super Ljava/lang/Thread;
.source "CletActivity.java"


# static fields
.field public static PlaySoundloop:Z

.field public static isConnected:Z

.field private static m_dlgInfo:Lcom/beyond/DialogInfo;

.field public static playSoundid:I

.field public static player:Landroid/media/MediaPlayer;


# instance fields
.field private context:Landroid/content/Context;

.field private host:Lcom/beyond/CletActivity;

.field private mCanvas:Landroid/graphics/Canvas;

.field private mHolder:Landroid/view/SurfaceHolder;

.field public readCount:I

.field socketMg:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/beyond/MySocket;",
            ">;"
        }
    .end annotation
.end field

.field private soundPool:Landroid/media/SoundPool;

.field private soundPoolMap:Ljava/util/HashMap;
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

.field public writeCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1305
    const/4 v0, -0x1

    sput v0, Lcom/beyond/AppThread;->playSoundid:I

    .line 1306
    sput-boolean v1, Lcom/beyond/AppThread;->PlaySoundloop:Z

    .line 1618
    sput-boolean v1, Lcom/beyond/AppThread;->isConnected:Z

    .line 997
    return-void
.end method

.method public constructor <init>(Lcom/beyond/CletActivity;)V
    .locals 2
    .param p1, "host"    # Lcom/beyond/CletActivity;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 1006
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 999
    iput-object v0, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    .line 1000
    iput-object v0, p0, Lcom/beyond/AppThread;->mCanvas:Landroid/graphics/Canvas;

    .line 1001
    iput-object v0, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    .line 1002
    iput-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    .line 1607
    iput v1, p0, Lcom/beyond/AppThread;->readCount:I

    .line 1608
    iput v1, p0, Lcom/beyond/AppThread;->writeCount:I

    .line 1621
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    .line 1007
    iput-object p1, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    .line 1008
    const-string v0, "Launcher"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 1010
    return-void
.end method

.method public constructor <init>(Lcom/beyond/CletActivity;[Ljava/lang/String;)V
    .locals 4
    .param p1, "host"    # Lcom/beyond/CletActivity;
    .param p2, "resNames"    # [Ljava/lang/String;

    .prologue
    .line 1013
    invoke-direct {p0, p1}, Lcom/beyond/AppThread;-><init>(Lcom/beyond/CletActivity;)V

    .line 1014
    if-eqz p2, :cond_0

    .line 1015
    new-instance v0, Landroid/media/SoundPool;

    array-length v1, p2

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/beyond/AppThread;->soundPool:Landroid/media/SoundPool;

    .line 1016
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    .line 1017
    invoke-direct {p0, p2}, Lcom/beyond/AppThread;->loadSoundPool([Ljava/lang/String;)V

    .line 1019
    :cond_0
    return-void
.end method

.method static synthetic access$0()Lcom/beyond/DialogInfo;
    .locals 1

    .prologue
    .line 1498
    sget-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    return-object v0
.end method

.method static synthetic access$1(Lcom/beyond/DialogInfo;)V
    .locals 0

    .prologue
    .line 1498
    sput-object p0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    return-void
.end method

.method static synthetic access$2(Lcom/beyond/AppThread;)Lcom/beyond/CletActivity;
    .locals 1

    .prologue
    .line 1002
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    return-object v0
.end method

.method private static getAudioManager()Landroid/media/AudioManager;
    .locals 3

    .prologue
    .line 1182
    sget-object v1, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 1183
    .local v0, "am":Landroid/media/AudioManager;
    return-object v0
.end method

.method private loadSoundPool([Ljava/lang/String;)V
    .locals 13
    .param p1, "resNames"    # [Ljava/lang/String;

    .prologue
    .line 1394
    const-string v0, "ext_res"

    invoke-static {v0}, Lcom/beyond/AppProperty;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1395
    .local v11, "resPath":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 1396
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    array-length v0, p1

    if-lt v9, v0, :cond_1

    .line 1417
    .end local v9    # "i":I
    :cond_0
    :goto_1
    return-void

    .line 1398
    .restart local v9    # "i":I
    :cond_1
    :try_start_0
    aget-object v10, p1, v9

    .line 1399
    .local v10, "resName":Ljava/lang/String;
    if-nez v11, :cond_2

    .line 1400
    sget-object v0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    .line 1401
    .local v7, "afd":Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->load(Ljava/io/FileDescriptor;JJI)I

    move-result v12

    .line 1403
    .local v12, "soundid":I
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 1404
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1396
    .end local v7    # "afd":Landroid/content/res/AssetFileDescriptor;
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1407
    .end local v12    # "soundid":I
    :cond_2
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPool:Landroid/media/SoundPool;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v2, p1, v9

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v12

    .line 1408
    .restart local v12    # "soundid":I
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1410
    .end local v10    # "resName":Ljava/lang/String;
    .end local v12    # "soundid":I
    :catch_0
    move-exception v8

    .line 1411
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public native BhandleBuyEvent(II)V
.end method

.method public native BhandleKeyEvent(II)Z
.end method

.method public native BhandleMediaEvent(Landroid/media/MediaPlayer;I)V
.end method

.method public native BhandleMotionEvent(III)V
.end method

.method public native BhandleNetEvent(II)V
.end method

.method public native BhandleTouchDrag(III)V
.end method

.method public native BhandleTouchPress(III)V
.end method

.method public native BhandleTouchRelease(III)V
.end method

.method public MyScoket_connection(Ljava/lang/Object;)V
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1818
    if-eqz p1, :cond_0

    move-object v0, p1

    .line 1820
    check-cast v0, Lcom/beyond/MySocket;

    .line 1821
    .local v0, "msc":Lcom/beyond/MySocket;
    invoke-virtual {v0}, Lcom/beyond/MySocket;->connection()V

    .line 1823
    .end local v0    # "msc":Lcom/beyond/MySocket;
    :cond_0
    return-void
.end method

.method public OpenURL(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 1707
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1708
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1709
    return-void
.end method

.method public TMethodCall()I
    .locals 1

    .prologue
    .line 1613
    const-string v0, "http://m.nate.com"

    invoke-virtual {p0, v0}, Lcom/beyond/AppThread;->OpenURL(Ljava/lang/String;)V

    .line 1614
    const/4 v0, 0x0

    return v0
.end method

.method public backlightalwayson()V
    .locals 0

    .prologue
    .line 1245
    invoke-static {}, Lcom/beyond/BacklightManager;->alwaysOn()V

    .line 1246
    return-void
.end method

.method public backlightoff()V
    .locals 0

    .prologue
    .line 1241
    invoke-static {}, Lcom/beyond/BacklightManager;->off()V

    .line 1242
    return-void
.end method

.method public backlighton(III)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "color"    # I
    .param p3, "duration"    # I

    .prologue
    .line 1237
    invoke-static {p1, p2, p3}, Lcom/beyond/BacklightManager;->on(III)V

    .line 1238
    return-void
.end method

.method public closeMedia(Lcom/beyond/CMediaPlayer;)V
    .locals 0
    .param p1, "player"    # Lcom/beyond/CMediaPlayer;

    .prologue
    .line 1177
    invoke-virtual {p1}, Lcom/beyond/CMediaPlayer;->close()V

    .line 1178
    const/4 p1, 0x0

    .line 1179
    return-void
.end method

.method public createMedia(I)Lcom/beyond/CMediaPlayer;
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 1154
    new-instance v0, Lcom/beyond/CMediaPlayer;

    iget-object v1, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1, p0}, Lcom/beyond/CMediaPlayer;-><init>(Ljava/io/File;ILcom/beyond/AppThread;)V

    .line 1155
    .local v0, "mp":Lcom/beyond/CMediaPlayer;
    return-object v0
.end method

.method public drawBeyondLogo()V
    .locals 7

    .prologue
    .line 1475
    const-string v5, "skip_blog"

    invoke-static {v5}, Lcom/beyond/AppProperty;->getInt(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_0

    .line 1476
    const-string v5, "fl.bl"

    invoke-static {v5}, Lcom/beyond/sui/SUIBase;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1478
    .local v1, "logo":Landroid/graphics/Bitmap;
    :goto_0
    iget-object v5, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    if-eqz v5, :cond_1

    .line 1486
    iget-object v5, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v5}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    .line 1488
    .local v0, "canvas":Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 1489
    .local v2, "paint":Landroid/graphics/Paint;
    const/4 v5, -0x1

    invoke-virtual {v0, v5}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 1490
    invoke-virtual {v0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    int-to-float v3, v5

    .line 1491
    .local v3, "x":F
    invoke-virtual {v0}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sub-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    int-to-float v4, v5

    .line 1492
    .local v4, "y":F
    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1494
    iget-object v5, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v5, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 1496
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v1    # "logo":Landroid/graphics/Bitmap;
    .end local v2    # "paint":Landroid/graphics/Paint;
    .end local v3    # "x":F
    .end local v4    # "y":F
    :cond_0
    return-void

    .line 1480
    .restart local v1    # "logo":Landroid/graphics/Bitmap;
    :cond_1
    const-wide/16 v5, 0x1

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1482
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public drawRightLogoI(I)V
    .locals 10
    .param p1, "restDays"    # I

    .prologue
    const/4 v9, 0x1

    .line 1419
    const/16 v5, 0x23

    .line 1420
    .local v5, "x":I
    const/16 v6, 0x28

    .line 1421
    .local v6, "y":I
    const/16 v1, 0xf

    .line 1422
    .local v1, "fontsize":I
    add-int/lit8 v2, v1, 0x5

    .line 1424
    .local v2, "h":I
    :goto_0
    iget-object v7, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    if-eqz v7, :cond_0

    .line 1432
    iget-object v7, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v7}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    .line 1434
    .local v0, "canvas":Landroid/graphics/Canvas;
    new-instance v3, Landroid/text/TextPaint;

    invoke-direct {v3}, Landroid/text/TextPaint;-><init>()V

    .line 1435
    .local v3, "paint":Landroid/text/TextPaint;
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v4

    .line 1436
    .local v4, "tf":Landroid/graphics/Typeface;
    int-to-float v7, v1

    invoke-virtual {v3, v7}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 1437
    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 1438
    invoke-virtual {v3, v9}, Landroid/text/TextPaint;->setSubpixelText(Z)V

    .line 1439
    invoke-virtual {v3, v9}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 1440
    const/4 v7, -0x1

    invoke-virtual {v3, v7}, Landroid/text/TextPaint;->setColor(I)V

    .line 1441
    invoke-virtual {v0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v3, v7}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    .line 1442
    sget-object v7, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v3, v7}, Landroid/text/TextPaint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 1444
    if-lez p1, :cond_1

    .line 1445
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "License will be expired "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " days after."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1446
    add-int/lit8 v6, v6, 0x14

    .line 1447
    const-string v7, "To continue testing,"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1448
    add-int/lit8 v6, v6, 0x14

    .line 1449
    const-string v7, "Touch the screen !!!"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1457
    :goto_1
    const/16 v6, 0xb4

    .line 1458
    const-string v7, "This application must be used for"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1459
    add-int/lit8 v6, v6, 0x14

    .line 1460
    const-string v7, "  non-commercial only."

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1461
    add-int/lit8 v6, v6, 0x14

    .line 1462
    const-string v7, "If you want to commercial use,"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1463
    add-int/lit8 v6, v6, 0x14

    .line 1464
    const-string v7, "  contact to biz@beyonde.co.kr"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1465
    add-int/lit8 v6, v6, 0x14

    .line 1466
    const-string v7, "       or        www.beyonde.co.kr"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1468
    iget-object v7, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v7, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 1469
    return-void

    .line 1426
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v3    # "paint":Landroid/text/TextPaint;
    .end local v4    # "tf":Landroid/graphics/Typeface;
    :cond_0
    const-wide/16 v7, 0x64

    :try_start_0
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1428
    :catch_0
    move-exception v7

    goto/16 :goto_0

    .line 1452
    .restart local v0    # "canvas":Landroid/graphics/Canvas;
    .restart local v3    # "paint":Landroid/text/TextPaint;
    .restart local v4    # "tf":Landroid/graphics/Typeface;
    :cond_1
    const-string v7, "License  alredy expired !!!"

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1453
    add-int/lit8 v6, v6, 0x14

    .line 1454
    const-string v7, "Get the new libraries."

    int-to-float v8, v5

    int-to-float v9, v6

    invoke-virtual {v0, v7, v8, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_1
.end method

.method public enableSensor(Z)V
    .locals 2
    .param p1, "isSet"    # Z

    .prologue
    .line 1233
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/beyond/CletActivity;->enableSensor(ZZ)Z

    .line 1234
    return-void
.end method

.method public findSocket(I)Lcom/beyond/MySocket;
    .locals 4
    .param p1, "fd"    # I

    .prologue
    .line 1639
    const/4 v2, 0x0

    .line 1640
    .local v2, "msoc":Lcom/beyond/MySocket;
    if-ltz p1, :cond_0

    .line 1642
    iget-object v3, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1643
    .local v1, "l":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_1

    .line 1654
    .end local v0    # "i":I
    .end local v1    # "l":I
    :cond_0
    const/4 v3, 0x0

    :goto_1
    return-object v3

    .line 1645
    .restart local v0    # "i":I
    .restart local v1    # "l":I
    :cond_1
    iget-object v3, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "msoc":Lcom/beyond/MySocket;
    check-cast v2, Lcom/beyond/MySocket;

    .line 1646
    .restart local v2    # "msoc":Lcom/beyond/MySocket;
    if-eqz v2, :cond_2

    .line 1647
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    if-ne v3, p1, :cond_2

    move-object v3, v2

    .line 1649
    goto :goto_1

    .line 1643
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 1522
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0}, Lcom/beyond/CletActivity;->finish()V

    .line 1523
    return-void
.end method

.method public getAssetResZip()[B
    .locals 6

    .prologue
    .line 1114
    :try_start_0
    iget-object v4, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "res.dat"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 1119
    .local v2, "is":Ljava/io/InputStream;
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v3

    .line 1122
    .local v3, "size":I
    new-array v0, v3, [B

    .line 1123
    .local v0, "buffer":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 1124
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1125
    return-object v0

    .line 1126
    .end local v0    # "buffer":[B
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "size":I
    :catch_0
    move-exception v1

    .line 1128
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getExtResZip(Ljava/lang/String;)[B
    .locals 8
    .param p1, "resPath"    # Ljava/lang/String;

    .prologue
    .line 1135
    :try_start_0
    new-instance v4, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "res.dat"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1136
    .local v4, "myfile":Ljava/io/File;
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1137
    .local v3, "inbuf":Ljava/io/FileInputStream;
    invoke-virtual {v3}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    .line 1139
    .local v2, "fd":Ljava/io/FileDescriptor;
    invoke-virtual {v3}, Ljava/io/FileInputStream;->available()I

    move-result v5

    .line 1142
    .local v5, "size":I
    new-array v0, v5, [B

    .line 1143
    .local v0, "buffer":[B
    invoke-virtual {v3, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 1144
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1145
    return-object v0

    .line 1146
    .end local v0    # "buffer":[B
    .end local v2    # "fd":Ljava/io/FileDescriptor;
    .end local v3    # "inbuf":Ljava/io/FileInputStream;
    .end local v4    # "myfile":Ljava/io/File;
    .end local v5    # "size":I
    :catch_0
    move-exception v1

    .line 1148
    .local v1, "e":Ljava/io/IOException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public getInformation(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 1276
    invoke-static {p1}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMuteState(Ljava/lang/String;)I
    .locals 6
    .param p1, "cateID"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1205
    invoke-static {}, Lcom/beyond/AppThread;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 1206
    .local v0, "am":Landroid/media/AudioManager;
    const-string v4, "RING"

    invoke-virtual {p1, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_2

    .line 1207
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    .line 1208
    .local v1, "muteState":I
    if-ne v1, v5, :cond_0

    .line 1209
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v4

    if-nez v4, :cond_1

    .line 1215
    .end local v1    # "muteState":I
    :cond_0
    :goto_0
    return v2

    .restart local v1    # "muteState":I
    :cond_1
    move v2, v3

    .line 1211
    goto :goto_0

    .end local v1    # "muteState":I
    :cond_2
    move v2, v3

    .line 1215
    goto :goto_0
.end method

.method public getNetworkInfo()I
    .locals 7

    .prologue
    .line 1071
    const/4 v3, 0x0

    .line 1072
    .local v3, "netinfo":I
    iget-object v5, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    const-string v6, "connectivity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 1073
    .local v2, "mng":Landroid/net/ConnectivityManager;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v4

    .line 1074
    .local v4, "ni":Landroid/net/NetworkInfo;
    const/4 v1, 0x0

    .line 1075
    .local v1, "isWifi":Z
    const/4 v0, 0x0

    .line 1076
    .local v0, "isMobile":Z
    if-eqz v4, :cond_0

    .line 1078
    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v1

    .line 1080
    :cond_0
    if-eqz v1, :cond_2

    .line 1082
    const/4 v3, 0x1

    .line 1094
    :cond_1
    :goto_0
    return v3

    .line 1084
    :cond_2
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v4

    .line 1085
    if-eqz v4, :cond_1

    .line 1087
    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v0

    .line 1088
    if-eqz v0, :cond_1

    .line 1090
    const/4 v3, 0x2

    goto :goto_0
.end method

.method public getResZip()[B
    .locals 2

    .prologue
    .line 1104
    const-string v1, "ext_res"

    invoke-static {v1}, Lcom/beyond/AppProperty;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1106
    .local v0, "extResPath":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1107
    invoke-virtual {p0}, Lcom/beyond/AppThread;->getAssetResZip()[B

    move-result-object v1

    .line 1108
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/beyond/AppThread;->getExtResZip(Ljava/lang/String;)[B

    move-result-object v1

    goto :goto_0
.end method

.method public getSoundMapID(Ljava/lang/String;)I
    .locals 4
    .param p1, "resName"    # Ljava/lang/String;

    .prologue
    const/4 v3, -0x1

    .line 1285
    const/4 v1, -0x1

    .line 1286
    .local v1, "ret":I
    iget-object v2, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    if-nez v2, :cond_0

    move v2, v3

    .line 1299
    :goto_0
    return v2

    .line 1288
    :cond_0
    if-nez p1, :cond_1

    move v2, v3

    .line 1290
    goto :goto_0

    .line 1293
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    move v2, v1

    .line 1299
    goto :goto_0

    .line 1294
    :catch_0
    move-exception v0

    .line 1296
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v2, v3

    .line 1297
    goto :goto_0
.end method

.method public getSoundMapKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "resName"    # Ljava/lang/String;

    .prologue
    .line 1279
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 1280
    const/4 v0, 0x0

    .line 1281
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPoolMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public getVolumeMedia()I
    .locals 4

    .prologue
    .line 1199
    invoke-static {}, Lcom/beyond/AppThread;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 1200
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v1, 0x3

    .line 1201
    .local v1, "streamType":I
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    div-int/2addr v2, v3

    return v2
.end method

.method public native initCanvas(Landroid/graphics/Canvas;)V
.end method

.method public knlshowExitDlg([C[C)V
    .locals 2
    .param p1, "title"    # [C
    .param p2, "error"    # [C

    .prologue
    .line 1501
    new-instance v0, Lcom/beyond/DialogInfo;

    invoke-direct {v0}, Lcom/beyond/DialogInfo;-><init>()V

    sput-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    .line 1502
    sget-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p2}, Ljava/lang/String;-><init>([C)V

    iput-object v1, v0, Lcom/beyond/DialogInfo;->content:Ljava/lang/String;

    .line 1503
    sget-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([C)V

    iput-object v1, v0, Lcom/beyond/DialogInfo;->title:Ljava/lang/String;

    .line 1504
    sget-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    const/16 v1, 0xb

    iput v1, v0, Lcom/beyond/DialogInfo;->type:I

    .line 1506
    sget-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    new-instance v1, Lcom/beyond/AppThread$1;

    invoke-direct {v1, p0}, Lcom/beyond/AppThread$1;-><init>(Lcom/beyond/AppThread;)V

    iput-object v1, v0, Lcom/beyond/DialogInfo;->listener:Landroid/content/DialogInterface$OnClickListener;

    .line 1518
    sget-object v0, Lcom/beyond/AppThread;->m_dlgInfo:Lcom/beyond/DialogInfo;

    invoke-static {v0}, Lcom/beyond/BeyondActivity;->showDialog(Lcom/beyond/DialogInfo;)V

    .line 1519
    return-void
.end method

.method public lockCanvas()V
    .locals 1

    .prologue
    .line 1035
    iget-object v0, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/AppThread;->mCanvas:Landroid/graphics/Canvas;

    .line 1036
    return-void
.end method

.method public netClose()I
    .locals 8

    .prologue
    .line 1795
    iget-object v5, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1796
    .local v3, "l":I
    const/4 v4, 0x0

    .line 1797
    .local v4, "msoc":Lcom/beyond/MySocket;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v3, :cond_0

    .line 1812
    iget-object v5, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1813
    const/4 v5, 0x0

    return v5

    .line 1800
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lcom/beyond/MySocket;

    move-object v4, v0

    .line 1801
    const-string v5, "TEST"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "netClose :"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1802
    if-eqz v4, :cond_1

    .line 1804
    invoke-virtual {v4}, Lcom/beyond/MySocket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1805
    const/4 v4, 0x0

    .line 1797
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1807
    :catch_0
    move-exception v1

    .line 1809
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public netSetReadCB(II)I
    .locals 2
    .param p1, "fd"    # I
    .param p2, "param"    # I

    .prologue
    .line 1695
    invoke-virtual {p0, p1}, Lcom/beyond/AppThread;->findSocket(I)Lcom/beyond/MySocket;

    move-result-object v0

    .line 1697
    .local v0, "msoc":Lcom/beyond/MySocket;
    if-eqz v0, :cond_0

    .line 1699
    iput p2, v0, Lcom/beyond/MySocket;->CBread:I

    .line 1700
    const/4 v1, 0x0

    .line 1703
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public netSetWriteCB(II)I
    .locals 2
    .param p1, "fd"    # I
    .param p2, "param"    # I

    .prologue
    .line 1674
    invoke-virtual {p0, p1}, Lcom/beyond/AppThread;->findSocket(I)Lcom/beyond/MySocket;

    move-result-object v0

    .line 1676
    .local v0, "msoc":Lcom/beyond/MySocket;
    if-eqz v0, :cond_0

    .line 1678
    iput p2, v0, Lcom/beyond/MySocket;->CBwrite:I

    .line 1680
    const/4 v1, 0x0

    .line 1683
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public netSocket(II)I
    .locals 2
    .param p1, "domain"    # I
    .param p2, "type"    # I

    .prologue
    .line 1626
    new-instance v0, Lcom/beyond/MySocket;

    invoke-direct {v0}, Lcom/beyond/MySocket;-><init>()V

    .line 1627
    .local v0, "soc":Lcom/beyond/MySocket;
    invoke-virtual {v0, p1, p2}, Lcom/beyond/MySocket;->setOption(II)V

    .line 1631
    iget-object v1, p0, Lcom/beyond/AppThread;->socketMg:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1632
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    return v1
.end method

.method public netSocketClose(I)I
    .locals 6
    .param p1, "fd"    # I

    .prologue
    const/4 v2, -0x1

    .line 1775
    invoke-virtual {p0, p1}, Lcom/beyond/AppThread;->findSocket(I)Lcom/beyond/MySocket;

    move-result-object v1

    .line 1776
    .local v1, "msoc":Lcom/beyond/MySocket;
    const-string v3, "TEST"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "netSocketClose fd="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1778
    if-eqz v1, :cond_0

    .line 1780
    :try_start_0
    const-string v3, "TEST"

    const-string v4, "netSocketClose OK"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1781
    invoke-virtual {v1}, Lcom/beyond/MySocket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1782
    const/4 v2, 0x0

    .line 1790
    :cond_0
    :goto_0
    return v2

    .line 1784
    :catch_0
    move-exception v0

    .line 1786
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "ERROR"

    const-string v4, "netSocketClose ERROR:"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1787
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public netSocketConnect(ILjava/lang/String;II)I
    .locals 2
    .param p1, "fd"    # I
    .param p2, "addr"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "param"    # I

    .prologue
    .line 1660
    invoke-virtual {p0, p1}, Lcom/beyond/AppThread;->findSocket(I)Lcom/beyond/MySocket;

    move-result-object v0

    .line 1662
    .local v0, "msoc":Lcom/beyond/MySocket;
    if-eqz v0, :cond_0

    .line 1664
    iput p4, v0, Lcom/beyond/MySocket;->CBconnect:I

    .line 1665
    invoke-virtual {v0, p2, p3}, Lcom/beyond/MySocket;->connect(Ljava/lang/String;I)V

    .line 1666
    const/4 v1, 0x0

    .line 1668
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public netSocketRead(I[BII)I
    .locals 6
    .param p1, "fd"    # I
    .param p2, "r"    # [B
    .param p3, "len"    # I
    .param p4, "param"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    const/16 v4, -0x13

    .line 1713
    invoke-virtual {p0, p1}, Lcom/beyond/AppThread;->findSocket(I)Lcom/beyond/MySocket;

    move-result-object v1

    .line 1715
    .local v1, "msoc":Lcom/beyond/MySocket;
    if-eqz v1, :cond_0

    if-eqz p4, :cond_0

    .line 1717
    iget-object v5, v1, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v5, :cond_1

    iget-object v5, v1, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->isConnected()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1769
    :cond_0
    :goto_0
    return v2

    .line 1723
    :cond_1
    iget-object v2, v1, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    if-eqz v2, :cond_7

    .line 1726
    iget-object v2, v1, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 1728
    iget-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    if-nez v2, :cond_2

    .line 1730
    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v5, v1, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    .line 1731
    iget-object v2, v1, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 1735
    :cond_2
    iget-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    if-nez v2, :cond_4

    .line 1737
    if-nez p3, :cond_3

    move v2, v3

    .line 1739
    goto :goto_0

    :cond_3
    move v2, v4

    .line 1742
    goto :goto_0

    .line 1746
    :cond_4
    iget-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v0

    .line 1748
    .local v0, "l":I
    if-ge v0, p3, :cond_5

    .line 1750
    move p3, v0

    .line 1753
    :cond_5
    iget-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v2, p2, v3, p3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result p3

    .line 1754
    iget-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v2

    if-gtz v2, :cond_6

    .line 1756
    const/4 v2, 0x0

    iput-object v2, v1, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    .line 1757
    iget v2, p0, Lcom/beyond/AppThread;->readCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/beyond/AppThread;->readCount:I

    .line 1758
    const-string v2, "TEST"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "netSocketRead READ OK END:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/beyond/AppThread;->readCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    move v2, p3

    .line 1764
    goto :goto_0

    .end local v0    # "l":I
    :cond_7
    move v2, v4

    .line 1766
    goto :goto_0
.end method

.method public netSocketWrite(I[BII)I
    .locals 2
    .param p1, "fd"    # I
    .param p2, "w"    # [B
    .param p3, "len"    # I
    .param p4, "param"    # I

    .prologue
    .line 1688
    invoke-virtual {p0, p1}, Lcom/beyond/AppThread;->findSocket(I)Lcom/beyond/MySocket;

    move-result-object v0

    .line 1689
    .local v0, "msoc":Lcom/beyond/MySocket;
    if-eqz v0, :cond_0

    .line 1690
    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, p3}, Lcom/beyond/MySocket;->write([BII)I

    move-result v1

    .line 1691
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public playMedia(Lcom/beyond/CMediaPlayer;)V
    .locals 0
    .param p1, "player"    # Lcom/beyond/CMediaPlayer;

    .prologue
    .line 1168
    invoke-virtual {p1}, Lcom/beyond/CMediaPlayer;->play()V

    .line 1169
    const/4 p1, 0x0

    .line 1170
    return-void
.end method

.method public playSoundMap(IZ)V
    .locals 7
    .param p1, "soundid"    # I
    .param p2, "repeate"    # Z

    .prologue
    const/4 v4, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    .line 1363
    if-eqz p2, :cond_0

    .line 1364
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPool:Landroid/media/SoundPool;

    const/4 v5, -0x1

    move v1, p1

    move v3, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 1365
    sput p1, Lcom/beyond/AppThread;->playSoundid:I

    .line 1372
    :goto_0
    return-void

    .line 1368
    :cond_0
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPool:Landroid/media/SoundPool;

    const/4 v5, 0x0

    move v1, p1

    move v3, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    goto :goto_0
.end method

.method public playSoundMap0(IZ)V
    .locals 3
    .param p1, "soundfileidx"    # I
    .param p2, "repeat"    # Z

    .prologue
    .line 1310
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "snd/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/beyond/CletActivity;->s_pool_type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/beyond/AppThread;->getSoundMapID(Ljava/lang/String;)I

    move-result v0

    .line 1312
    .local v0, "soundid":I
    sput v0, Lcom/beyond/AppThread;->playSoundid:I

    .line 1313
    sput-boolean p2, Lcom/beyond/AppThread;->PlaySoundloop:Z

    .line 1315
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1316
    invoke-virtual {p0, v0, p2}, Lcom/beyond/AppThread;->playSoundMap(IZ)V

    .line 1318
    :cond_0
    return-void
.end method

.method public native pltFinish()V
.end method

.method public native pltPause()V
.end method

.method public native pltResume()V
.end method

.method public native pltStart(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public run()V
    .locals 2

    .prologue
    .line 1046
    iget-object v0, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/beyond/AppThread;->pltStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    return-void
.end method

.method public setBuyItem(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "pid"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;

    .prologue
    .line 1545
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0, p1}, Lcom/beyond/CletActivity;->KT_Purchase(Ljava/lang/String;)V

    .line 1547
    return-void
.end method

.method public setBuyItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "pid"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;
    .param p3, "send_data"    # Ljava/lang/String;

    .prologue
    .line 1562
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0, p1}, Lcom/beyond/CletActivity;->KT_Purchase(Ljava/lang/String;)V

    .line 1580
    return-void
.end method

.method public native setCanvas(IIIIII)V
.end method

.method public setCanvas(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1027
    iput-object p1, p0, Lcom/beyond/AppThread;->mCanvas:Landroid/graphics/Canvas;

    .line 1028
    return-void
.end method

.method public setCanvasSize(IIIIII)V
    .locals 0
    .param p1, "appW"    # I
    .param p2, "appH"    # I
    .param p3, "plX"    # I
    .param p4, "plY"    # I
    .param p5, "plW"    # I
    .param p6, "plH"    # I

    .prologue
    .line 1031
    invoke-virtual/range {p0 .. p6}, Lcom/beyond/AppThread;->setCanvas(IIIIII)V

    .line 1032
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "appContext"    # Landroid/content/Context;

    .prologue
    .line 1100
    iput-object p1, p0, Lcom/beyond/AppThread;->context:Landroid/content/Context;

    .line 1101
    return-void
.end method

.method public setHolder(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "mHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 1023
    iput-object p1, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    .line 1024
    return-void
.end method

.method public setVolumeMedia(I)V
    .locals 4
    .param p1, "volume"    # I

    .prologue
    const/4 v3, 0x0

    .line 1186
    invoke-static {}, Lcom/beyond/AppThread;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 1187
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v1, 0x3

    .line 1190
    .local v1, "streamType":I
    if-lez p1, :cond_0

    sget-boolean v2, Lcom/beyond/MediaBridge;->volum_onoff_mode:Z

    if-eqz v2, :cond_0

    .line 1191
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 1195
    :goto_0
    return-void

    .line 1193
    :cond_0
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v2

    mul-int/2addr v2, p1

    div-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    goto :goto_0
.end method

.method public setresMedia(Lcom/beyond/CMediaPlayer;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "player"    # Lcom/beyond/CMediaPlayer;
    .param p2, "resName"    # Ljava/lang/String;
    .param p3, "repeate"    # Z

    .prologue
    .line 1164
    invoke-virtual {p1, p2, p3}, Lcom/beyond/CMediaPlayer;->setres(Ljava/lang/String;Z)V

    .line 1165
    const/4 p1, 0x0

    .line 1166
    return-void
.end method

.method public showWeb(Ljava/lang/String;)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1586
    if-eqz p1, :cond_0

    .line 1588
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 1589
    .local v2, "rc":Landroid/graphics/Rect;
    invoke-virtual {v2, v3, v3, v4, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 1590
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 1591
    .local v0, "msg":Landroid/os/Message;
    new-instance v1, Lcom/beyond/util/MessageInfo;

    invoke-direct {v1}, Lcom/beyond/util/MessageInfo;-><init>()V

    .line 1593
    .local v1, "msgInfo":Lcom/beyond/util/MessageInfo;
    iput v3, v1, Lcom/beyond/util/MessageInfo;->command:I

    .line 1594
    iput v3, v1, Lcom/beyond/util/MessageInfo;->subCommand:I

    .line 1595
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v3, v1, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    .line 1596
    iput-object p1, v1, Lcom/beyond/util/MessageInfo;->stringValue:Ljava/lang/String;

    .line 1598
    const/16 v3, 0x12c

    iput v3, v0, Landroid/os/Message;->what:I

    .line 1599
    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1601
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1605
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "msgInfo":Lcom/beyond/util/MessageInfo;
    .end local v2    # "rc":Landroid/graphics/Rect;
    :cond_0
    return-void
.end method

.method public stopMedia(Lcom/beyond/CMediaPlayer;)V
    .locals 0
    .param p1, "player"    # Lcom/beyond/CMediaPlayer;

    .prologue
    .line 1172
    invoke-virtual {p1}, Lcom/beyond/CMediaPlayer;->stop()V

    .line 1173
    const/4 p1, 0x0

    .line 1174
    return-void
.end method

.method public stopSoundMap(I)V
    .locals 1
    .param p1, "soundid"    # I

    .prologue
    .line 1388
    iget-object v0, p0, Lcom/beyond/AppThread;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0, p1}, Landroid/media/SoundPool;->stop(I)V

    .line 1391
    return-void
.end method

.method public stopSoundMap0(I)V
    .locals 3
    .param p1, "soundfileidx"    # I

    .prologue
    .line 1332
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "snd/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/beyond/CletActivity;->s_pool_type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/beyond/AppThread;->getSoundMapID(Ljava/lang/String;)I

    move-result v0

    .line 1334
    .local v0, "soundid":I
    invoke-virtual {p0, v0}, Lcom/beyond/AppThread;->stopSoundMap(I)V

    .line 1335
    const/4 v1, -0x1

    sput v1, Lcom/beyond/AppThread;->playSoundid:I

    .line 1336
    return-void
.end method

.method public stopSoundMap1()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 1324
    sget v0, Lcom/beyond/AppThread;->playSoundid:I

    if-eq v0, v1, :cond_0

    .line 1326
    sget v0, Lcom/beyond/AppThread;->playSoundid:I

    invoke-virtual {p0, v0}, Lcom/beyond/AppThread;->stopSoundMap(I)V

    .line 1327
    sput v1, Lcom/beyond/AppThread;->playSoundid:I

    .line 1329
    :cond_0
    return-void
.end method

.method public suiGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1265
    iget-object v1, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v1, p1, p2}, Lcom/beyond/CletActivity;->suiGetValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1266
    .local v0, "ret":Ljava/lang/String;
    const/4 p2, 0x0

    .line 1267
    return-object v0
.end method

.method public suiSetValue(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 1270
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/CletActivity;->suiSetValue(ILjava/lang/String;Ljava/lang/String;)V

    .line 1271
    const/4 p2, 0x0

    .line 1272
    const/4 p3, 0x0

    .line 1273
    return-void
.end method

.method public suihide(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1257
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0, p1}, Lcom/beyond/CletActivity;->suihide(Ljava/lang/String;)V

    .line 1258
    const/4 p1, 0x0

    .line 1259
    return-void
.end method

.method public suihideall()V
    .locals 1

    .prologue
    .line 1261
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0}, Lcom/beyond/CletActivity;->suihideall()V

    .line 1262
    return-void
.end method

.method public suiinit()V
    .locals 0

    .prologue
    .line 1250
    return-void
.end method

.method public suishow(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1252
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0, p1}, Lcom/beyond/CletActivity;->suishow(Ljava/lang/String;)V

    .line 1253
    const/4 p1, 0x0

    .line 1254
    return-void
.end method

.method public unlockCanvas()V
    .locals 2

    .prologue
    .line 1039
    iget-object v0, p0, Lcom/beyond/AppThread;->host:Lcom/beyond/CletActivity;

    invoke-virtual {v0}, Lcom/beyond/CletActivity;->drawsui()V

    .line 1040
    iget-object v0, p0, Lcom/beyond/AppThread;->mCanvas:Landroid/graphics/Canvas;

    if-eqz v0, :cond_0

    .line 1041
    iget-object v0, p0, Lcom/beyond/AppThread;->mHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/beyond/AppThread;->mCanvas:Landroid/graphics/Canvas;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 1043
    :cond_0
    return-void
.end method

.method public vibrator(II)V
    .locals 4
    .param p1, "level"    # I
    .param p2, "duration"    # I

    .prologue
    .line 1220
    :try_start_0
    sget-object v2, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    .line 1221
    const-string v3, "vibrator"

    .line 1220
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    .line 1222
    .local v1, "vib":Landroid/os/Vibrator;
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    .line 1223
    invoke-virtual {v1}, Landroid/os/Vibrator;->cancel()V

    .line 1230
    .end local v1    # "vib":Landroid/os/Vibrator;
    :goto_0
    return-void

    .line 1225
    .restart local v1    # "vib":Landroid/os/Vibrator;
    :cond_0
    int-to-long v2, p2

    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1226
    .end local v1    # "vib":Landroid/os/Vibrator;
    :catch_0
    move-exception v0

    .line 1228
    .local v0, "e":Ljava/lang/SecurityException;
    goto :goto_0
.end method

.method public writeMedia(Lcom/beyond/CMediaPlayer;[BZ)V
    .locals 0
    .param p1, "player"    # Lcom/beyond/CMediaPlayer;
    .param p2, "data"    # [B
    .param p3, "repeate"    # Z

    .prologue
    .line 1159
    invoke-virtual {p1, p2, p3}, Lcom/beyond/CMediaPlayer;->wirtedata([BZ)V

    .line 1160
    const/4 p1, 0x0

    .line 1161
    return-void
.end method
