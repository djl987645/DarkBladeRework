.class public Lcom/beyond/screen/KeyButton;
.super Landroid/widget/ImageView;
.source "KeyButton.java"


# static fields
.field static final STATE_NORMAL:I = 0x0

.field static final STATE_PRESSED:I = 0x1


# instance fields
.field bg:I

.field bm_n:Landroid/graphics/Bitmap;

.field bm_p:Landroid/graphics/Bitmap;

.field isShow:Ljava/lang/Boolean;

.field key_code:I

.field name:Ljava/lang/String;

.field rect:Landroid/graphics/Rect;

.field state:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 28
    iput-object v1, p0, Lcom/beyond/screen/KeyButton;->name:Ljava/lang/String;

    .line 29
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/screen/KeyButton;->isShow:Ljava/lang/Boolean;

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/beyond/screen/KeyButton;->state:I

    .line 33
    iput-object v1, p0, Lcom/beyond/screen/KeyButton;->bm_n:Landroid/graphics/Bitmap;

    .line 34
    iput-object v1, p0, Lcom/beyond/screen/KeyButton;->bm_p:Landroid/graphics/Bitmap;

    .line 39
    return-void
.end method


# virtual methods
.method createBitmap(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 43
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 44
    .local v1, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 45
    invoke-static {p1, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 49
    .local v0, "bm":Landroid/graphics/Bitmap;
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 51
    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 53
    invoke-static {p1, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 54
    return-object v0
.end method

.method loadImage(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "state"    # I

    .prologue
    .line 58
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 60
    .local v2, "res":Landroid/content/res/Resources;
    const/4 v1, 0x0

    .line 62
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "res_pad/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v1

    .line 64
    if-nez v1, :cond_0

    .line 86
    :goto_0
    return-void

    .line 74
    :cond_0
    if-nez p3, :cond_1

    .line 75
    invoke-virtual {p0, v1}, Lcom/beyond/screen/KeyButton;->createBitmap(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/screen/KeyButton;->bm_n:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 78
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/beyond/screen/KeyButton;->createBitmap(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/screen/KeyButton;->bm_p:Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 91
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 92
    .local v1, "paint":Landroid/graphics/Paint;
    const/high16 v2, -0x10000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 93
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 97
    const/4 v0, 0x0

    .line 99
    .local v0, "bm":Landroid/graphics/Bitmap;
    iget v2, p0, Lcom/beyond/screen/KeyButton;->state:I

    if-nez v2, :cond_1

    .line 100
    iget-object v0, p0, Lcom/beyond/screen/KeyButton;->bm_n:Landroid/graphics/Bitmap;

    .line 106
    :goto_0
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 107
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 109
    if-eqz v0, :cond_0

    .line 110
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-direct {v2, v6, v6, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/beyond/screen/KeyButton;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/beyond/screen/KeyButton;->getHeight()I

    move-result v5

    invoke-direct {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 111
    :cond_0
    return-void

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/beyond/screen/KeyButton;->bm_p:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    .line 114
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    invoke-static {v1}, Lcom/beyond/screen/KeyCode;->getWipiTouchEvent(I)I

    move-result v0

    .line 115
    .local v0, "action":I
    if-gez v0, :cond_0

    .line 128
    :goto_0
    return v2

    .line 118
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_2

    .line 119
    iput v2, p0, Lcom/beyond/screen/KeyButton;->state:I

    .line 125
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/beyond/screen/KeyButton;->invalidate()V

    .line 127
    iget v1, p0, Lcom/beyond/screen/KeyButton;->key_code:I

    invoke-static {v0, v1}, Lcom/beyond/screen/ScreenConfig;->sendWipiKeyEvent(II)V

    goto :goto_0

    .line 121
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v2, :cond_1

    .line 122
    const/4 v1, 0x0

    iput v1, p0, Lcom/beyond/screen/KeyButton;->state:I

    goto :goto_1
.end method
