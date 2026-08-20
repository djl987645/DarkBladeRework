.class Lcom/beyond/CletActivity$AppFrameBuffer;
.super Lcom/beyond/CletView;
.source "CletActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/CletActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AppFrameBuffer"
.end annotation


# instance fields
.field IS_DBTOUCH:Z

.field pcount:I

.field pid:I

.field final synthetic this$0:Lcom/beyond/CletActivity;


# direct methods
.method constructor <init>(Lcom/beyond/CletActivity;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    .line 128
    iput-object p1, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    .line 129
    invoke-direct {p0, p2}, Lcom/beyond/CletView;-><init>(Landroid/content/Context;)V

    .line 191
    iput-boolean v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->IS_DBTOUCH:Z

    .line 192
    iput v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->pid:I

    .line 193
    const/4 v0, 0x0

    iput v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->pcount:I

    .line 130
    invoke-virtual {p0}, Lcom/beyond/CletActivity$AppFrameBuffer;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/beyond/CletActivity;->access$0(Lcom/beyond/CletActivity;Landroid/view/SurfaceHolder;)V

    .line 131
    invoke-static {p1}, Lcom/beyond/CletActivity;->access$1(Lcom/beyond/CletActivity;)Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 132
    return-void
.end method

.method private dumpEvent(Landroid/view/MotionEvent;)V
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x5

    .line 165
    const/16 v5, 0xa

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "DOWN"

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const-string v6, "UP"

    aput-object v6, v3, v5

    const/4 v5, 0x2

    const-string v6, "MOVE"

    aput-object v6, v3, v5

    const/4 v5, 0x3

    const-string v6, "CANCEL"

    aput-object v6, v3, v5

    const/4 v5, 0x4

    const-string v6, "OUTSIDE"

    aput-object v6, v3, v5

    .line 166
    const-string v5, "POINTER_DOWN"

    aput-object v5, v3, v7

    const-string v5, "POINTER_UP"

    aput-object v5, v3, v8

    const/4 v5, 0x7

    const-string v6, "7?"

    aput-object v6, v3, v5

    const/16 v5, 0x8

    const-string v6, "8?"

    aput-object v6, v3, v5

    const/16 v5, 0x9

    const-string v6, "9?"

    aput-object v6, v3, v5

    .line 167
    .local v3, "names":[Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 169
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    .line 170
    .local v1, "actionCode":I
    const-string v5, "event ACTION_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    if-eq v1, v7, :cond_0

    .line 172
    if-ne v1, v8, :cond_1

    .line 173
    :cond_0
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 174
    shr-int/lit8 v6, v0, 0x8

    .line 173
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_1
    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-lt v2, v5, :cond_2

    .line 186
    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    const-string v5, "TOUCH"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    return-void

    .line 179
    :cond_2
    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    const-string v5, ")="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 184
    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private getWipiTouchEvent(I)I
    .locals 1
    .param p1, "action"    # I

    .prologue
    .line 339
    const/4 v0, -0x1

    .line 341
    .local v0, "ret":I
    packed-switch p1, :pswitch_data_0

    .line 353
    :goto_0
    return v0

    .line 343
    :pswitch_0
    const/16 v0, 0xf

    .line 344
    goto :goto_0

    .line 346
    :pswitch_1
    const/16 v0, 0x10

    .line 347
    goto :goto_0

    .line 349
    :pswitch_2
    const/16 v0, 0x11

    goto :goto_0

    .line 341
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onTouchDbEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x2

    const/4 v9, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    .line 197
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    .line 199
    .local v3, "pointerCount":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-le v6, v7, :cond_0

    .line 200
    invoke-super {p0, p1}, Lcom/beyond/CletView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 282
    :goto_0
    return v9

    .line 203
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 204
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    .line 205
    .local v1, "actionCode":I
    const/4 v4, 0x0

    .line 206
    .local v4, "x":I
    const/4 v5, 0x0

    .line 207
    .local v5, "y":I
    const/4 v2, 0x0

    .line 208
    .local v2, "i":I
    shr-int/lit8 v6, v0, 0x8

    if-lez v6, :cond_1

    .line 210
    shr-int/lit8 v2, v0, 0x8

    .line 213
    :cond_1
    if-eq v1, v7, :cond_7

    .line 215
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v4, v6

    .line 216
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v5, v6

    .line 218
    iget v6, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->x_ratio:F

    cmpl-float v6, v6, v8

    if-eqz v6, :cond_2

    .line 219
    int-to-float v6, v4

    iget v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->x_ratio:F

    mul-float/2addr v6, v7

    float-to-int v4, v6

    .line 220
    :cond_2
    iget v6, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->y_ratio:F

    cmpl-float v6, v6, v8

    if-eqz v6, :cond_3

    .line 221
    int-to-float v6, v5

    iget v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->y_ratio:F

    mul-float/2addr v6, v7

    float-to-int v5, v6

    .line 224
    :cond_3
    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 226
    :pswitch_1
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    goto :goto_0

    .line 230
    :pswitch_2
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    goto :goto_0

    .line 233
    :pswitch_3
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_0

    .line 237
    :pswitch_4
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_0

    .line 241
    :pswitch_5
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchDrag(III)V

    goto :goto_0

    .line 250
    :cond_4
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v4, v6

    .line 251
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v5, v6

    .line 253
    iget v6, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->x_ratio:F

    cmpl-float v6, v6, v8

    if-eqz v6, :cond_5

    .line 254
    int-to-float v6, v4

    iget v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->x_ratio:F

    mul-float/2addr v6, v7

    float-to-int v4, v6

    .line 255
    :cond_5
    iget v6, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->y_ratio:F

    cmpl-float v6, v6, v8

    if-eqz v6, :cond_6

    .line 256
    int-to-float v6, v5

    iget v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->y_ratio:F

    mul-float/2addr v6, v7

    float-to-int v5, v6

    .line 259
    :cond_6
    packed-switch v1, :pswitch_data_1

    .line 248
    :goto_1
    :pswitch_6
    add-int/lit8 v2, v2, 0x1

    :cond_7
    if-lt v2, v3, :cond_4

    goto/16 :goto_0

    .line 261
    :pswitch_7
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    goto :goto_1

    .line 265
    :pswitch_8
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    goto :goto_1

    .line 268
    :pswitch_9
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_1

    .line 272
    :pswitch_a
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_1

    .line 276
    :pswitch_b
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v2}, Lcom/beyond/AppThread;->BhandleTouchDrag(III)V

    goto :goto_1

    .line 224
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_4
    .end packed-switch

    .line 259
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_9
        :pswitch_b
        :pswitch_6
        :pswitch_6
        :pswitch_8
        :pswitch_a
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v6, 0x1

    .line 288
    iget-object v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->suiMgr:Lcom/beyond/sui/SUImanager;

    invoke-virtual {v7, p1, p0}, Lcom/beyond/sui/SUImanager;->onTouchEvent(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 335
    :goto_0
    return v6

    .line 290
    :cond_0
    iget-boolean v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->IS_DBTOUCH:Z

    if-eqz v7, :cond_1

    .line 292
    invoke-virtual {p0, p1}, Lcom/beyond/CletActivity$AppFrameBuffer;->onTouchDbEvent(Landroid/view/MotionEvent;)Z

    move-result v6

    goto :goto_0

    .line 296
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    .line 298
    .local v2, "pointerCount":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    const/4 v8, 0x2

    if-le v7, v8, :cond_2

    .line 299
    invoke-super {p0, p1}, Lcom/beyond/CletView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 302
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 303
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    .line 304
    .local v1, "actionCode":I
    const/4 v4, 0x0

    .line 305
    .local v4, "x":I
    const/4 v5, 0x0

    .line 308
    .local v5, "y":I
    const/4 v3, 0x0

    .line 309
    .local v3, "tcId":I
    shr-int/lit8 v3, v0, 0x8

    .line 310
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    float-to-int v4, v7

    .line 311
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    float-to-int v5, v7

    .line 313
    iget v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->x_ratio:F

    cmpl-float v7, v7, v9

    if-eqz v7, :cond_3

    .line 314
    int-to-float v7, v4

    iget v8, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->x_ratio:F

    mul-float/2addr v7, v8

    float-to-int v4, v7

    .line 315
    :cond_3
    iget v7, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->y_ratio:F

    cmpl-float v7, v7, v9

    if-eqz v7, :cond_4

    .line 316
    int-to-float v7, v5

    iget v8, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->y_ratio:F

    mul-float/2addr v7, v8

    float-to-int v5, v7

    .line 318
    :cond_4
    packed-switch v1, :pswitch_data_0

    .line 335
    :pswitch_0
    invoke-super {p0, p1}, Lcom/beyond/CletView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v6

    goto :goto_0

    .line 322
    :pswitch_1
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v7

    invoke-virtual {v7, v4, v5, v3}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    goto :goto_0

    .line 327
    :pswitch_2
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v7

    invoke-virtual {v7, v4, v5, v3}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_0

    .line 331
    :pswitch_3
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v7

    invoke-virtual {v7, v4, v5, v3}, Lcom/beyond/AppThread;->BhandleTouchDrag(III)V

    goto :goto_0

    .line 318
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 136
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v0, p1}, Lcom/beyond/CletActivity;->access$0(Lcom/beyond/CletActivity;Landroid/view/SurfaceHolder;)V

    .line 140
    iget-object v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    iget-object v1, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v1}, Lcom/beyond/CletActivity;->access$1(Lcom/beyond/CletActivity;)Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/beyond/CletActivity;->access$2(Lcom/beyond/CletActivity;Landroid/graphics/Canvas;)V

    .line 141
    iget-object v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v0}, Lcom/beyond/CletActivity;->access$3(Lcom/beyond/CletActivity;)Landroid/graphics/Canvas;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v0

    iget-object v1, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v1}, Lcom/beyond/CletActivity;->access$1(Lcom/beyond/CletActivity;)Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/beyond/AppThread;->setHolder(Landroid/view/SurfaceHolder;)V

    .line 143
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v0

    iget-object v1, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v1}, Lcom/beyond/CletActivity;->access$3(Lcom/beyond/CletActivity;)Landroid/graphics/Canvas;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/beyond/AppThread;->setCanvas(Landroid/graphics/Canvas;)V

    .line 144
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v0

    iget-object v1, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v1}, Lcom/beyond/CletActivity;->access$3(Lcom/beyond/CletActivity;)Landroid/graphics/Canvas;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/beyond/AppThread;->initCanvas(Landroid/graphics/Canvas;)V

    .line 145
    iget-object v0, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v0}, Lcom/beyond/CletActivity;->access$1(Lcom/beyond/CletActivity;)Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/beyond/CletActivity$AppFrameBuffer;->this$0:Lcom/beyond/CletActivity;

    invoke-static {v1}, Lcom/beyond/CletActivity;->access$3(Lcom/beyond/CletActivity;)Landroid/graphics/Canvas;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 156
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 160
    return-void
.end method
