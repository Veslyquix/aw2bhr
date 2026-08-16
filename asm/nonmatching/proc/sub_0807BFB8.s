	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BFB8
sub_0807BFB8: @ 0x0807BFB8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r3, #0
	b _0807C00A
_0807BFC2:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r3, #1
	lsls r1, r0, #5
	adds r5, r0, #0
	cmn r2, r1
	ble _0807C006
	lsls r1, r3, #5
	movs r0, #0xf0
	subs r0, r0, r1
	cmp r2, r0
	bge _0807C006
	ldr r0, _0807C028 @ =gUnknown_0202FF78
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r1, r2, r1
	ldr r0, _0807C02C @ =0x000001FF
	ands r1, r0
	adds r0, #1
	orrs r1, r0
	lsls r0, r3, #3
	adds r0, #0x80
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	lsls r2, r2, #2
	ldr r3, _0807C030 @ =gUnknown_0848B6E6
	bl sub_0801BEFC
_0807C006:
	adds r3, r5, #0
	adds r0, r4, #0
_0807C00A:
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r3, r0
	blt _0807BFC2
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #0x18
	strh r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C028: .4byte gUnknown_0202FF78
_0807C02C: .4byte 0x000001FF
_0807C030: .4byte gUnknown_0848B6E6

