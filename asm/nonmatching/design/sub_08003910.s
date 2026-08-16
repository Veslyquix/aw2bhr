	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003910
sub_08003910: @ 0x08003910
	push {lr}
	ldr r0, _08003928 @ =gUnknown_08485D8C
	movs r1, #0
	bl sub_080152EC
	ldr r0, _0800392C @ =gUnknown_0200B0B0
	ldr r0, [r0]
	adds r0, #0x42
	ldr r1, _08003930 @ =0x0000FFF6
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08003928: .4byte gUnknown_08485D8C
_0800392C: .4byte gUnknown_0200B0B0
_08003930: .4byte 0x0000FFF6

