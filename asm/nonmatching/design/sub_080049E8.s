	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080049E8
sub_080049E8: @ 0x080049E8
	push {lr}
	bl sub_0801A614
	bl sub_0801A168
	movs r0, #6
	bl sub_0800056C
	ldr r0, _08004A18 @ =gUnknown_084872B4
	movs r1, #0
	bl sub_080152EC
	ldr r0, _08004A1C @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x46
	movs r0, #0x57
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x10
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08004A18: .4byte gUnknown_084872B4
_08004A1C: .4byte gUnknown_0200B0B0

