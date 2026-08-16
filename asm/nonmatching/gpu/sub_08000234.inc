	push {r4, r5, r6, r7}
	mov r7, #0x3e0
_0800023C:
	ldr r0, _08000230 @ =gUnknown_0200B5F4
	add r0, r0, r7, lsr #5
	ldrsb r5, [r0]
	tst r5, r5
	beq _080002F4
	ldr r4, _0800022C @ =gUnknown_0200B614
	lsr r0, r7, #1
	add r0, r0, r0, lsl #1
	add r0, r0, #0x30
	add r4, r4, r0
	mov r6, #0x1e
_08000268:
	sub r4, r4, #3
	ldrb r0, [r4]
	add r0, r0, r5
	strb r0, [r4]
	subs r0, r0, #0x20
	bpl _08000284
	mov r0, #0
_08000284:
	cmp r0, #0x20
	blo _08000290
	mov r0, #0x1f
_08000290:
	ldrb r1, [r4, #1]
	add r1, r1, r5
	strb r1, [r4, #1]
	subs r1, r1, #0x20
	bpl _080002A8
	mov r1, #0
_080002A8:
	cmp r1, #0x20
	blo _080002B4
	mov r1, #0x1f
_080002B4:
	ldrb r2, [r4, #2]
	add r2, r2, r5
	strb r2, [r4, #2]
	subs r2, r2, #0x20
	bpl _080002CC
	mov r2, #0
_080002CC:
	cmp r2, #0x20
	blo _080002D8
	mov r2, #0x1f
_080002D8:
	add r0, r0, r1, lsl #5
	add r0, r0, r2, lsl #10
	ldr r1, _08000228 @ =gUnknown_030020C0
	add r1, r1, r6
	strh r0, [r1, r7]
	subs r6, r6, #2
	bpl _08000268
_080002F4:
	subs r7, r7, #0x20
	bpl _0800023C
	pop {r4, r5, r6, r7}
	bx lr
