	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C208
sub_0805C208: @ 0x0805C208
	push {r4, lr}
	movs r4, #0
	ldr r0, _0805C254 @ =gUnknown_03004770
	ldr r0, [r0]
	cmp r0, #1
	bhi _0805C260
	ldr r0, _0805C258 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r2, r0, #1
	adds r3, r0, #0
	adds r3, #0x40
	cmp r2, r3
	bge _0805C24A
	ldr r0, _0805C25C @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	subs r2, r3, r2
_0805C230:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805C242
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0x5a
	bhi _0805C242
	adds r4, #1
_0805C242:
	adds r1, #0xc
	subs r2, #1
	cmp r2, #0
	bne _0805C230
_0805C24A:
	cmp r4, #0
	beq _0805C260
	movs r0, #1
	b _0805C262
	.align 2, 0
_0805C254: .4byte gUnknown_03004770
_0805C258: .4byte gUnknown_03003F2C
_0805C25C: .4byte gUnknown_08499594
_0805C260:
	movs r0, #0
_0805C262:
	pop {r4}
	pop {r1}
	bx r1

