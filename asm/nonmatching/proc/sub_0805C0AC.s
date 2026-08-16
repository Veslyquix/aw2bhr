	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C0AC
sub_0805C0AC: @ 0x0805C0AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0805C108 @ =gUnknown_03003F2C
	ldrh r3, [r0]
	adds r2, r3, #0
	adds r2, #0x40
	cmp r3, r2
	bge _0805C100
	ldr r0, _0805C10C @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r6, _0805C110 @ =gUnknown_03003340
	movs r5, #1
	rsbs r5, r5, #0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	subs r3, r2, r3
_0805C0D0:
	ldrb r0, [r1]
	cmp r0, #0x14
	bne _0805C0F8
	ldrb r0, [r1, #7]
	cmp r0, #0
	bne _0805C0F8
	ldrb r0, [r1, #3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r2, [r1, #2]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	beq _0805C0F8
	strh r2, [r4]
	ldrb r0, [r1, #3]
	strh r0, [r4, #2]
_0805C0F8:
	adds r1, #0xc
	subs r3, #1
	cmp r3, #0
	bne _0805C0D0
_0805C100:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C108: .4byte gUnknown_03003F2C
_0805C10C: .4byte gUnknown_08499594
_0805C110: .4byte gUnknown_03003340

