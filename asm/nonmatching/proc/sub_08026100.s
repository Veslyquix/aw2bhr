	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026100
sub_08026100: @ 0x08026100
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r4, #0
	blt _0802618A
	cmp r1, #0
	blt _0802618A
	ldr r0, _08026168 @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r4, r0
	bge _0802618A
	ldrh r6, [r3, #2]
	cmp r1, r6
	bge _0802618A
	ldr r2, _0802616C @ =gUnknown_08499594
	lsls r1, r1, #1
	ldr r6, _08026170 @ =0x0000417A
	adds r0, r3, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	ldr r4, _08026174 @ =0x0000051A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802618A
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0802618A
	ldrb r2, [r4, #4]
	lsls r3, r2, #0x19
	lsrs r1, r3, #0x19
	adds r0, r5, #1
	cmp r1, r0
	bge _08026178
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #4]
	b _0802618A
	.align 2, 0
_08026168: .4byte gUnknown_08499590
_0802616C: .4byte gUnknown_08499594
_08026170: .4byte 0x0000417A
_08026174: .4byte 0x0000051A
_08026178:
	lsrs r0, r3, #0x19
	subs r0, r0, r5
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #4]
_0802618A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

