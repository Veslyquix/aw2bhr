	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A2E4
sub_0801A2E4: @ 0x0801A2E4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	ldr r1, _0801A35C @ =gUnknown_0808E5C0
	mov r0, sp
	movs r2, #4
	bl sub_0808B6E8
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x10
	cmp r5, #0x1f
	bhi _0801A30E
	ldr r0, _0801A360 @ =0x00000367
	adds r1, r0, #0
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r6]
_0801A30E:
	adds r6, #2
	adds r5, #1
	movs r3, #0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #2
	cmp r3, r0
	bge _0801A344
	movs r7, #1
	adds r2, r0, #0
_0801A322:
	cmp r5, #0x1f
	bhi _0801A336
	adds r0, r3, #0
	ands r0, r7
	lsls r0, r0, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r6]
_0801A336:
	adds r6, #2
	adds r5, #1
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blt _0801A322
_0801A344:
	cmp r5, #0x1f
	bhi _0801A352
	ldr r0, _0801A364 @ =0x00000369
	adds r1, r0, #0
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r6]
_0801A352:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A35C: .4byte gUnknown_0808E5C0
_0801A360: .4byte 0x00000367
_0801A364: .4byte 0x00000369

