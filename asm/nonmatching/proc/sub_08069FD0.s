	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069FD0
sub_08069FD0: @ 0x08069FD0
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r4, _0806A028 @ =gUnknown_08580E60
	ldr r1, [r4]
	ldr r2, _0806A02C @ =0x01000400
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0806A030 @ =gUnknown_08184FF4
	ldr r1, _0806A034 @ =0x06008000
	bl Decompress
	ldr r0, _0806A038 @ =gUnknown_08185F0C
	ldr r1, _0806A03C @ =0x0600C000
	bl Decompress
	ldr r0, _0806A040 @ =gUnknown_081866D8
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806A044 @ =gUnknown_0818633C
	ldr r1, _0806A048 @ =gUnknown_08499580
	ldr r1, [r1]
	bl Decompress
	ldr r0, _0806A04C @ =gUnknown_08186460
	ldr r1, [r4]
	bl Decompress
	bl sub_08013B0C
	ldr r0, [r4]
	ldr r1, _0806A050 @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A028: .4byte gUnknown_08580E60
_0806A02C: .4byte 0x01000400
_0806A030: .4byte gUnknown_08184FF4
_0806A034: .4byte 0x06008000
_0806A038: .4byte gUnknown_08185F0C
_0806A03C: .4byte 0x0600C000
_0806A040: .4byte gUnknown_081866D8
_0806A044: .4byte gUnknown_0818633C
_0806A048: .4byte gUnknown_08499580
_0806A04C: .4byte gUnknown_08186460
_0806A050: .4byte 0x0600F000

