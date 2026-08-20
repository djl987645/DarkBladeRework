.class public Lcom/beyond/JletView;
.super Landroid/view/View;
.source "JletView.java"


# instance fields
.field mx:F

.field my:F

.field private suiMgr:Lcom/beyond/sui/SUImanager;

.field private x_ratio:F

.field private y_ratio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 29
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    iput v0, p0, Lcom/beyond/JletView;->x_ratio:F

    .line 23
    iput v0, p0, Lcom/beyond/JletView;->y_ratio:F

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/JletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    .line 96
    iput v1, p0, Lcom/beyond/JletView;->mx:F

    .line 97
    iput v1, p0, Lcom/beyond/JletView;->my:F

    .line 30
    invoke-static {p0}, Lcom/beyond/sui/SUImanager;->getInstance(Ljava/lang/Object;)Lcom/beyond/sui/SUImanager;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/JletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    .line 31
    return-void
.end method

.method private getWipiTouchEvent(I)I
    .locals 1
    .param p1, "action"    # I

    .prologue
    .line 215
    const/4 v0, -0x1

    .line 217
    .local v0, "ret":I
    packed-switch p1, :pswitch_data_0

    .line 229
    :goto_0
    return v0

    .line 219
    :pswitch_0
    const/4 v0, 0x1

    .line 220
    goto :goto_0

    .line 222
    :pswitch_1
    const/4 v0, 0x2

    .line 223
    goto :goto_0

    .line 225
    :pswitch_2
    const/4 v0, 0x5

    goto :goto_0

    .line 217
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private onDrawJavaBeyondLogo(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 198
    const-string v4, "skip_blog"

    invoke-static {v4}, Lcom/beyond/AppProperty;->getInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    .line 199
    const-string v4, "fl.bl"

    invoke-static {v4}, Lcom/beyond/sui/SUIBase;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 201
    .local v0, "logo":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 202
    .local v1, "paint":Landroid/graphics/Paint;
    const/4 v4, -0x1

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 207
    invoke-virtual {p0}, Lcom/beyond/JletView;->getWidth()I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    int-to-float v2, v4

    .line 208
    .local v2, "x":F
    invoke-virtual {p0}, Lcom/beyond/JletView;->getHeight()I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    int-to-float v3, v4

    .line 210
    .local v3, "y":F
    invoke-virtual {p0}, Lcom/beyond/JletView;->getLeft()I

    move-result v4

    int-to-float v4, v4

    sub-float v4, v2, v4

    invoke-virtual {p0}, Lcom/beyond/JletView;->getTop()I

    move-result v5

    int-to-float v5, v5

    sub-float v5, v3, v5

    invoke-virtual {p1, v0, v4, v5, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 212
    .end local v0    # "logo":Landroid/graphics/Bitmap;
    .end local v1    # "paint":Landroid/graphics/Paint;
    .end local v2    # "x":F
    .end local v3    # "y":F
    :cond_0
    return-void
.end method

.method private onDrawJavaRightLogo(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v8, 0x1

    .line 157
    const/16 v4, 0x23

    .line 158
    .local v4, "x":I
    const/16 v5, 0x28

    .line 159
    .local v5, "y":I
    const/16 v0, 0xf

    .line 160
    .local v0, "fontsize":I
    add-int/lit8 v1, v0, 0x5

    .line 162
    .local v1, "h":I
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    .line 163
    .local v2, "paint":Landroid/text/TextPaint;
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v3

    .line 164
    .local v3, "tf":Landroid/graphics/Typeface;
    int-to-float v6, v0

    invoke-virtual {v2, v6}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 165
    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 166
    invoke-virtual {v2, v8}, Landroid/text/TextPaint;->setSubpixelText(Z)V

    .line 167
    invoke-virtual {v2, v8}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 168
    const/4 v6, -0x1

    invoke-virtual {v2, v6}, Landroid/text/TextPaint;->setColor(I)V

    .line 169
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v2, v6}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    .line 170
    sget-object v6, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v2, v6}, Landroid/text/TextPaint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 172
    sget v6, Lcom/beyond/JletActivity;->restDays:I

    if-lez v6, :cond_0

    .line 173
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "License will be expired "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v7, Lcom/beyond/JletActivity;->restDays:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " days after."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 174
    add-int/lit8 v5, v5, 0x14

    .line 175
    const-string v6, "To continue testing,"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 176
    add-int/lit8 v5, v5, 0x14

    .line 177
    const-string v6, "Touch the screen !!!"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 185
    :goto_0
    const/16 v5, 0xb4

    .line 186
    const-string v6, "This application must be used for"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 187
    add-int/lit8 v5, v5, 0x14

    .line 188
    const-string v6, "  non-commercial only."

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 189
    add-int/lit8 v5, v5, 0x14

    .line 190
    const-string v6, "If you want to commercial use,"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 191
    add-int/lit8 v5, v5, 0x14

    .line 192
    const-string v6, "  contact to biz@beyonde.co.kr"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 193
    add-int/lit8 v5, v5, 0x14

    .line 194
    const-string v6, "       or        www.beyonde.co.kr"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 195
    return-void

    .line 180
    :cond_0
    const-string v6, "License  alredy expired !!!"

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 181
    add-int/lit8 v5, v5, 0x14

    .line 182
    const-string v6, "Get the new libraries."

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-virtual {p1, v6, v7, v8, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method private print_test(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 39
    sget v2, Lcom/beyond/BeyondBridge;->build_mode:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 40
    const-string v2, "is_test_mode"

    invoke-static {v2}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "build_mode":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 42
    sput v4, Lcom/beyond/BeyondBridge;->build_mode:I

    .line 50
    .end local v0    # "build_mode":Ljava/lang/String;
    :cond_0
    :goto_0
    sget v2, Lcom/beyond/BeyondBridge;->build_mode:I

    if-ne v2, v5, :cond_1

    .line 51
    invoke-virtual {p2}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v1

    .line 52
    .local v1, "fm":Landroid/graphics/Paint$FontMetricsInt;
    const-string v2, "SHOW AppStore"

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    add-int/lit8 v3, v3, -0x64

    int-to-float v3, v3

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-virtual {p1, v2, v3, v4, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 54
    .end local v1    # "fm":Landroid/graphics/Paint$FontMetricsInt;
    :cond_1
    return-void

    .line 43
    .restart local v0    # "build_mode":Ljava/lang/String;
    :cond_2
    const-string v2, "Y"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 44
    sput v5, Lcom/beyond/BeyondBridge;->build_mode:I

    goto :goto_0

    .line 46
    :cond_3
    sput v4, Lcom/beyond/BeyondBridge;->build_mode:I

    goto :goto_0
.end method


# virtual methods
.method public native BhandleTouchRelease()I
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x1

    .line 57
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 59
    sget v2, Lcom/beyond/JletActivity;->logoState:I

    if-ne v2, v3, :cond_2

    .line 60
    invoke-direct {p0, p1}, Lcom/beyond/JletView;->onDrawJavaRightLogo(Landroid/graphics/Canvas;)V

    .line 65
    :cond_0
    :goto_0
    sget v2, Lcom/beyond/JletActivity;->logoState:I

    if-eqz v2, :cond_3

    .line 94
    :cond_1
    :goto_1
    return-void

    .line 62
    :cond_2
    sget v2, Lcom/beyond/JletActivity;->logoState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 63
    invoke-direct {p0, p1}, Lcom/beyond/JletView;->onDrawJavaBeyondLogo(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 69
    :cond_3
    sget-boolean v2, Lcom/beyond/JletActivity;->isAppCreaed:Z

    if-eqz v2, :cond_1

    .line 73
    :try_start_0
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 74
    .local v1, "paint":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lcom/beyond/JletView;->getWidth()I

    move-result v2

    sget-object v3, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    iget-object v3, v3, Lcom/beyond/JletBridge;->dis0:Lcom/beyond/DisplayBridge;

    iget v3, v3, Lcom/beyond/DisplayBridge;->m_w:I

    if-ne v2, v3, :cond_4

    invoke-virtual {p0}, Lcom/beyond/JletView;->getHeight()I

    move-result v2

    sget-object v3, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    iget-object v3, v3, Lcom/beyond/JletBridge;->dis0:Lcom/beyond/DisplayBridge;

    iget v3, v3, Lcom/beyond/DisplayBridge;->m_h:I

    if-eq v2, v3, :cond_5

    .line 75
    :cond_4
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 76
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 80
    :cond_5
    sget-object v2, Lcom/beyond/LcduiBridge;->screen_bm:Landroid/graphics/Bitmap;

    .line 81
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    sget-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    iget-object v6, v6, Lcom/beyond/JletBridge;->dis0:Lcom/beyond/DisplayBridge;

    iget v6, v6, Lcom/beyond/DisplayBridge;->m_w:I

    sget-object v7, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    iget-object v7, v7, Lcom/beyond/JletBridge;->dis0:Lcom/beyond/DisplayBridge;

    iget v7, v7, Lcom/beyond/DisplayBridge;->m_h:I

    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v8

    iget v8, v8, Lcom/beyond/screen/AnnunInfo;->height:I

    sub-int/2addr v7, v8

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 82
    new-instance v4, Landroid/graphics/Rect;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/beyond/JletView;->getWidth()I

    move-result v7

    invoke-virtual {p0}, Lcom/beyond/JletView;->getHeight()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 80
    invoke-virtual {p1, v2, v3, v4, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 87
    iget-object v2, p0, Lcom/beyond/JletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v2, p1}, Lcom/beyond/sui/SUImanager;->paint(Landroid/graphics/Canvas;)V

    .line 88
    sget-object v2, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-eqz v2, :cond_1

    .line 89
    invoke-direct {p0, p1, v1}, Lcom/beyond/JletView;->print_test(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 91
    .end local v1    # "paint":Landroid/graphics/Paint;
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x3

    const/4 v3, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x2

    const/4 v2, 0x1

    .line 102
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    if-ne v4, v6, :cond_2

    .line 103
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget v5, p0, Lcom/beyond/JletView;->mx:F

    cmpl-float v4, v4, v5

    if-nez v4, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iget v5, p0, Lcom/beyond/JletView;->my:F

    cmpl-float v4, v4, v5

    if-nez v4, :cond_1

    .line 151
    :cond_0
    :goto_0
    return v2

    .line 106
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iput v4, p0, Lcom/beyond/JletView;->mx:F

    .line 107
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iput v4, p0, Lcom/beyond/JletView;->my:F

    .line 110
    :cond_2
    iget-object v4, p0, Lcom/beyond/JletView;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v4, p1, p0}, Lcom/beyond/sui/SUImanager;->onTouchEvent(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/beyond/JletView;->getWipiTouchEvent(I)I

    move-result v0

    .line 113
    .local v0, "action":I
    if-gez v0, :cond_3

    move v2, v3

    .line 114
    goto :goto_0

    .line 118
    :cond_3
    sget-boolean v4, Lcom/beyond/JletActivity;->CONFIG_BUILD_SDK:Z

    if-eqz v4, :cond_4

    sget-object v4, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-nez v4, :cond_4

    .line 119
    sget v4, Lcom/beyond/JletActivity;->logoState:I

    if-eqz v4, :cond_4

    .line 120
    if-ne v0, v6, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/beyond/JletView;->BhandleTouchRelease()I

    goto :goto_0

    .line 127
    :cond_4
    const/4 v4, 0x4

    new-array v1, v4, [I

    .line 128
    .local v1, "evt":[I
    aput v6, v1, v3

    .line 129
    aput v0, v1, v2

    .line 131
    iget v3, p0, Lcom/beyond/JletView;->x_ratio:F

    cmpl-float v3, v3, v7

    if-eqz v3, :cond_5

    .line 132
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Lcom/beyond/JletView;->x_ratio:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    aput v3, v1, v6

    .line 136
    :goto_1
    iget v3, p0, Lcom/beyond/JletView;->y_ratio:F

    cmpl-float v3, v3, v7

    if-eqz v3, :cond_6

    .line 137
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v4, p0, Lcom/beyond/JletView;->y_ratio:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    aput v3, v1, v8

    .line 149
    :goto_2
    sget-object v3, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    if-eqz v3, :cond_0

    .line 150
    sget-object v3, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v3, v1}, Lcom/beyond/JletBridge;->postEvent([I)Z

    goto :goto_0

    .line 134
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    aput v3, v1, v6

    goto :goto_1

    .line 139
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    aput v3, v1, v8

    goto :goto_2
.end method

.method setScaleRatio(FF)V
    .locals 0
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 34
    iput p1, p0, Lcom/beyond/JletView;->x_ratio:F

    .line 35
    iput p2, p0, Lcom/beyond/JletView;->y_ratio:F

    .line 36
    return-void
.end method
