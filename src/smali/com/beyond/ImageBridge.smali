.class public Lcom/beyond/ImageBridge;
.super Ljava/lang/Object;
.source "ImageBridge.java"


# static fields
.field static final ANIMATED_MASK:I = 0x2

.field private static final DEFAULT_DELAY:I = 0x12c

.field static final MUTABLE_MASK:I = 0x1


# instance fields
.field bm:Landroid/graphics/Bitmap;

.field protected bpl:I

.field public delay:I

.field protected h:I

.field protected imgData:[B

.field protected imgMask:[B

.field protected imgSrc:[B

.field protected imgType:I

.field loopcount:I

.field private mMovieStart:J

.field public mask:I

.field protected mbpl:I

.field protected movie:Landroid/graphics/Movie;

.field private rel_time:I

.field protected scratch:[B

.field protected transColor:I

.field protected type:I

.field protected w:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object v0, p0, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 27
    iput-object v0, p0, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    .line 35
    iput v2, p0, Lcom/beyond/ImageBridge;->loopcount:I

    .line 39
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/beyond/ImageBridge;->mMovieStart:J

    .line 41
    iput v2, p0, Lcom/beyond/ImageBridge;->rel_time:I

    .line 59
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/ImageBridge;->transColor:I

    .line 18
    return-void
.end method

.method protected static createBitmap(Ljava/io/InputStream;Lcom/beyond/ImageBridge;)Z
    .locals 6
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "img"    # Lcom/beyond/ImageBridge;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 151
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 152
    .local v1, "opts":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 153
    invoke-static {p0, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 157
    .local v0, "bm":Landroid/graphics/Bitmap;
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 159
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 161
    invoke-static {p0, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 164
    if-nez v0, :cond_0

    .line 166
    :try_start_0
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "len:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    :goto_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "malforamtted"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 174
    :cond_0
    iget-object v4, v1, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    const-string v5, "image/gif"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 175
    invoke-static {p0}, Landroid/graphics/Movie;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Movie;

    move-result-object v4

    iput-object v4, p1, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    .line 176
    iget v4, p1, Lcom/beyond/ImageBridge;->mask:I

    or-int/lit8 v4, v4, 0x2

    iput v4, p1, Lcom/beyond/ImageBridge;->mask:I

    .line 177
    const/16 v4, 0x12c

    iput v4, p1, Lcom/beyond/ImageBridge;->delay:I

    .line 180
    :cond_1
    if-nez v0, :cond_2

    .line 187
    :goto_1
    return v2

    .line 183
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iput v2, p1, Lcom/beyond/ImageBridge;->w:I

    .line 184
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iput v2, p1, Lcom/beyond/ImageBridge;->h:I

    .line 185
    iput-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    move v2, v3

    .line 187
    goto :goto_1

    .line 168
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected static createImage(Ljava/lang/String;Lcom/beyond/ImageBridge;)V
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    invoke-static {p0}, Lcom/beyond/ImageBridge;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 246
    .local v0, "is":Ljava/io/InputStream;
    if-nez v0, :cond_0

    .line 247
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " do not exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 250
    :cond_0
    invoke-static {v0, p1}, Lcom/beyond/ImageBridge;->createBitmap(Ljava/io/InputStream;Lcom/beyond/ImageBridge;)Z

    .line 257
    return-void
.end method

.method protected static createImage0([BIILcom/beyond/ImageBridge;)V
    .locals 4
    .param p0, "imagedata"    # [B
    .param p1, "imageoffset"    # I
    .param p2, "imagelength"    # I
    .param p3, "newimg"    # Lcom/beyond/ImageBridge;

    .prologue
    const/4 v2, 0x0

    .line 198
    if-nez p0, :cond_0

    .line 199
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Imagedata is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    :cond_0
    if-gez p1, :cond_1

    .line 205
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 208
    :cond_1
    array-length v1, p0

    sub-int/2addr v1, p2

    if-le p1, v1, :cond_2

    .line 209
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 212
    :cond_2
    if-nez p2, :cond_3

    array-length v1, p0

    if-ne p1, v1, :cond_3

    .line 213
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 218
    :cond_3
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 219
    .local v0, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 220
    invoke-static {p0, p1, p2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 222
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 224
    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 226
    invoke-static {p0, p1, p2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 228
    iget-object v1, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    if-nez v1, :cond_4

    .line 229
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is malforamtted"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 231
    :cond_4
    iget-object v1, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, p3, Lcom/beyond/ImageBridge;->w:I

    .line 232
    iget-object v1, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, p3, Lcom/beyond/ImageBridge;->h:I

    .line 233
    return-void
.end method

.method protected static createImage1(Lcom/beyond/ImageBridge;IILcom/beyond/ImageBridge;)V
    .locals 3
    .param p0, "img"    # Lcom/beyond/ImageBridge;
    .param p1, "imageoffset"    # I
    .param p2, "imagelength"    # I
    .param p3, "newimg"    # Lcom/beyond/ImageBridge;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 238
    iget-object v0, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p3, Lcom/beyond/ImageBridge;->w:I

    .line 239
    iget-object v0, p3, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p3, Lcom/beyond/ImageBridge;->h:I

    .line 241
    return-void
.end method

.method protected static createImage2(IILcom/beyond/ImageBridge;)V
    .locals 1
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "newimg"    # Lcom/beyond/ImageBridge;

    .prologue
    .line 116
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p2, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 118
    iget-object v0, p2, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p2, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p2, Lcom/beyond/ImageBridge;->w:I

    .line 120
    iget-object v0, p2, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p2, Lcom/beyond/ImageBridge;->h:I

    .line 122
    :cond_0
    return-void
.end method

.method protected static getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x2f

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 125
    if-nez p0, :cond_0

    .line 126
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "name is null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 128
    :cond_0
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_1

    .line 129
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 135
    :cond_1
    :try_start_0
    invoke-static {p0}, Lcom/beyond/JletActivity;->getResource(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 136
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_2

    move-object v2, v1

    .line 145
    .end local v1    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    :goto_0
    return-object v2

    .line 138
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    :cond_2
    sget-object v3, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, p0, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_1
    move-object v2, v1

    .line 145
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    goto :goto_0

    .line 140
    .end local v2    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v6, :cond_3

    .line 142
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 143
    :cond_3
    invoke-static {}, Lcom/beyond/JletActivity;->getCurrentJlet()Lcom/beyond/JletBridge;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_1
.end method

.method protected static noti()V
    .locals 2

    .prologue
    .line 62
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ImageBridge.noti"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 63
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "not Implemented Image class !!!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected createSubImage0(IIIILcom/beyond/ImageBridge;)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "newimg"    # Lcom/beyond/ImageBridge;

    .prologue
    .line 192
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p4, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p5, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 193
    iget-object v0, p5, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p5, Lcom/beyond/ImageBridge;->w:I

    .line 194
    iget-object v0, p5, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p5, Lcom/beyond/ImageBridge;->h:I

    .line 195
    return-void
.end method

.method protected decodeNextImageBasic()I
    .locals 1

    .prologue
    .line 112
    const/4 v0, -0x2

    return v0
.end method

.method protected decodeNextImageExt()I
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 83
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 84
    .local v1, "now":J
    iget-wide v3, p0, Lcom/beyond/ImageBridge;->mMovieStart:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    .line 85
    iput-wide v1, p0, Lcom/beyond/ImageBridge;->mMovieStart:J

    .line 87
    :cond_0
    iget-wide v3, p0, Lcom/beyond/ImageBridge;->mMovieStart:J

    sub-long v3, v1, v3

    long-to-int v0, v3

    .line 88
    .local v0, "diff":I
    iput-wide v1, p0, Lcom/beyond/ImageBridge;->mMovieStart:J

    .line 91
    iget-object v3, p0, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    if-eqz v3, :cond_1

    .line 92
    iget v3, p0, Lcom/beyond/ImageBridge;->loopcount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/beyond/ImageBridge;->loopcount:I

    .line 93
    iget v3, p0, Lcom/beyond/ImageBridge;->loopcount:I

    mul-int/lit16 v3, v3, 0x12c

    iget-object v4, p0, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    invoke-virtual {v4}, Landroid/graphics/Movie;->duration()I

    move-result v4

    if-le v3, v4, :cond_2

    .line 94
    iput v7, p0, Lcom/beyond/ImageBridge;->loopcount:I

    .line 96
    iput v7, p0, Lcom/beyond/ImageBridge;->rel_time:I

    .line 104
    :goto_0
    iget-object v3, p0, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    iget v4, p0, Lcom/beyond/ImageBridge;->rel_time:I

    invoke-virtual {v3, v4}, Landroid/graphics/Movie;->setTime(I)Z

    .line 105
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "diff:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",relTime:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/beyond/ImageBridge;->rel_time:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 108
    :cond_1
    return v7

    .line 100
    :cond_2
    iget v3, p0, Lcom/beyond/ImageBridge;->loopcount:I

    mul-int/lit16 v3, v3, 0x12c

    iput v3, p0, Lcom/beyond/ImageBridge;->rel_time:I

    goto :goto_0
.end method

.method protected getHeight()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/beyond/ImageBridge;->h:I

    return v0
.end method

.method protected getWidth()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/beyond/ImageBridge;->w:I

    return v0
.end method
