	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022878
sub_08022878: @ 0x08022878
	push {lr}
	ldr r0, _08022894 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080228A0
	ldr r0, _08022898 @ =gUnknown_08091B9C
	ldr r1, _0802289C @ =0x06003600
	movs r2, #0x80
	bl sub_08011C68
	b _080228AA
	.align 2, 0
_08022894: .4byte gUnknown_03004008
_08022898: .4byte gUnknown_08091B9C
_0802289C: .4byte 0x06003600
_080228A0:
	ldr r0, _080228B0 @ =gUnknown_0809181C
	ldr r1, _080228B4 @ =0x06003600
	movs r2, #0x80
	bl sub_08011C68
_080228AA:
	pop {r0}
	bx r0
	.align 2, 0
_080228B0: .4byte gUnknown_0809181C
_080228B4: .4byte 0x06003600

