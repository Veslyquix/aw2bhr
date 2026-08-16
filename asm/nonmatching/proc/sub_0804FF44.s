	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804FF44
sub_0804FF44: @ 0x0804FF44
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0804FFD4 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r4, r0
	bne _0804FFCC
	ldr r1, _0804FFD8 @ =gUnknown_08562128
	ldr r6, _0804FFDC @ =gUnknown_03004580
	lsls r3, r4, #4
	adds r0, r6, #0
	adds r0, #8
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #4
	beq _0804FFCC
	ldr r2, _0804FFE0 @ =gUnknown_085D6A48
	adds r0, r6, #2
	adds r0, r3, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #9
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0804FFCC
	ldr r1, _0804FFE4 @ =gUnknown_08552138
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #0xd
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0804FFE8 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, _0804FFEC @ =gUnknown_0300453C
	strh r4, [r0]
	ldr r0, _0804FFF0 @ =gUnknown_08553580
	ldr r3, _0804FFF4 @ =gUnknown_08559420
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	movs r2, #0
	bl sub_08015410
	ldr r2, _0804FFF8 @ =gUnknown_0202967C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_0804FFCC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFD4: .4byte gUnknown_0300450C
_0804FFD8: .4byte gUnknown_08562128
_0804FFDC: .4byte gUnknown_03004580
_0804FFE0: .4byte gUnknown_085D6A48
_0804FFE4: .4byte gUnknown_08552138
_0804FFE8: .4byte 0x06010000
_0804FFEC: .4byte gUnknown_0300453C
_0804FFF0: .4byte gUnknown_08553580
_0804FFF4: .4byte gUnknown_08559420
_0804FFF8: .4byte gUnknown_0202967C

