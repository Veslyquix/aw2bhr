	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051920
sub_08051920: @ 0x08051920
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r3, _08051980 @ =gUnknown_02029A10
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r2, #1
	adds r1, r4, #0
	eors r1, r2
	movs r2, #0xb4
	muls r1, r2, r1
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	bne _0805195C
	ldr r0, _08051984 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r4, r0
	beq _0805195C
	ldr r0, _08051988 @ =gUnknown_02029664
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
_0805195C:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0805197A
	adds r0, r4, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805197A
	adds r0, r4, #0
	bl sub_08015328
_0805197A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051980: .4byte gUnknown_02029A10
_08051984: .4byte gUnknown_0300450C
_08051988: .4byte gUnknown_02029664

