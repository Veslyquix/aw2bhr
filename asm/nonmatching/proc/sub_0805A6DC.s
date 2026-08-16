	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A6DC
sub_0805A6DC: @ 0x0805A6DC
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r1, _0805A734 @ =gUnknown_03003F2C
	ldrh r2, [r1]
	adds r0, r2, #0
	adds r0, #0x40
	cmp r2, r0
	bge _0805A722
	ldr r7, _0805A738 @ =gUnknown_08499594
	movs r6, #0
	adds r5, r1, #0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r4, r0, #2
_0805A6F8:
	ldr r0, [r7]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x17
	bne _0805A716
	ldrb r0, [r1, #9]
	lsrs r0, r0, #6
	cmp r0, #1
	bhi _0805A716
	ldrb r0, [r1, #2]
	strb r0, [r3]
	ldrb r0, [r1, #3]
	strb r0, [r3, #1]
	strh r6, [r3, #2]
	adds r3, #4
_0805A716:
	adds r4, #0xc
	adds r2, #1
	ldrh r0, [r5]
	adds r0, #0x40
	cmp r2, r0
	blt _0805A6F8
_0805A722:
	ldr r0, _0805A73C @ =0x0000FFFF
	strh r0, [r3, #2]
	ldr r0, _0805A740 @ =gUnknown_03003F20
	ldr r0, [r0]
	subs r0, r3, r0
	asrs r0, r0, #2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A734: .4byte gUnknown_03003F2C
_0805A738: .4byte gUnknown_08499594
_0805A73C: .4byte 0x0000FFFF
_0805A740: .4byte gUnknown_03003F20

