	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080247A4
sub_080247A4: @ 0x080247A4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080247CC @ =0xFF4C0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xb
	bhi _080247D8
	ldr r0, _080247D0 @ =0x00000724
	bl sub_08014E44
	bl sub_08037B84
	ldr r0, _080247D4 @ =gUnknown_03003F68
	ldr r1, [r0]
	movs r0, #8
	bl sub_0801AC58
	b _0802480A
	.align 2, 0
_080247CC: .4byte 0xFF4C0000
_080247D0: .4byte 0x00000724
_080247D4: .4byte gUnknown_03003F68
_080247D8:
	ldr r0, _08024810 @ =0x00000A14
	bl sub_08014E44
	bl sub_08037B84
	ldr r4, _08024814 @ =gUnknown_085C77A0
	bl sub_0803866C
	lsls r0, r0, #2
	movs r1, #0x5c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r2, r4, #0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r4, [r0]
	cmp r4, #0
	bne _08024800
	adds r0, r1, r2
	ldr r4, [r0]
_08024800:
	ldr r0, _08024818 @ =gUnknown_03003F68
	ldr r1, [r0]
	adds r0, r4, #0
	bl LZ77UnCompWram
_0802480A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024810: .4byte 0x00000A14
_08024814: .4byte gUnknown_085C77A0
_08024818: .4byte gUnknown_03003F68

