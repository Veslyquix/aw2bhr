	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A18C
sub_0804A18C: @ 0x0804A18C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	ldr r0, _0804A1B0 @ =gUnknown_030044E0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A1C4
	adds r0, r1, #0
	adds r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A1B8
	ldr r0, _0804A1B4 @ =gUnknown_084C3CB7
	adds r0, r2, r0
	b _0804A1DC
	.align 2, 0
_0804A1B0: .4byte gUnknown_030044E0
_0804A1B4: .4byte gUnknown_084C3CB7
_0804A1B8:
	ldr r0, _0804A1C0 @ =gUnknown_084C3C5C
	adds r0, r2, r0
	b _0804A1DC
	.align 2, 0
_0804A1C0: .4byte gUnknown_084C3C5C
_0804A1C4:
	adds r0, r1, #0
	adds r0, #0x66
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A1D8
	ldr r0, _0804A1D4 @ =gUnknown_084C3BA6
	adds r0, r2, r0
	b _0804A1DC
	.align 2, 0
_0804A1D4: .4byte gUnknown_084C3BA6
_0804A1D8:
	ldr r0, _0804A1E0 @ =gUnknown_084C3C01
	adds r0, r3, r0
_0804A1DC:
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0804A1E0: .4byte gUnknown_084C3C01

