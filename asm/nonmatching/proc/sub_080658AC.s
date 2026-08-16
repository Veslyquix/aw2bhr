	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080658AC
sub_080658AC: @ 0x080658AC
	push {r4, r5, lr}
	ldr r0, _08065910 @ =gUnknown_0816E110
	ldr r4, [r0]
	ldr r2, [r4]
	movs r3, #0
	adds r1, r2, #0
	adds r1, #0x84
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _080658C4
	movs r3, #1
_080658C4:
	strb r3, [r2]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x85
	ldrb r0, [r0]
	strb r0, [r1, #6]
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x86
	ldrb r1, [r0]
	adds r1, #2
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r2, #4]
	movs r1, #0
	adds r0, r2, #0
	adds r0, #0x89
	ldrb r0, [r0]
	cmp r0, #0
	bne _080658F4
	movs r1, #1
_080658F4:
	strb r1, [r2, #1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x8a
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	bne _08065914
	movs r0, #0
	b _08065916
	.align 2, 0
_08065910: .4byte gUnknown_0816E110
_08065914:
	adds r0, #4
_08065916:
	strb r0, [r1, #3]
	ldr r0, [r5]
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x88
	ldrb r0, [r0]
	adds r2, r0, #0
	cmp r2, #0
	bne _0806592C
	strb r2, [r1, #7]
	b _08065934
_0806592C:
	adds r0, #0xff
	ldrb r2, [r1, #0x15]
	adds r0, r0, r2
	strb r0, [r1, #7]
_08065934:
	movs r4, #0
	ldr r5, _0806595C @ =gUnknown_08580934
_08065938:
	ldr r3, [r5]
	adds r2, r3, #0
	adds r2, #0x20
	adds r2, r2, r4
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [r3, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, #1
	cmp r4, #3
	ble _08065938
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806595C: .4byte gUnknown_08580934

