	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801137C
sub_0801137C: @ 0x0801137C
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, _08011394 @ =gUnknown_03002B5C
	ldrh r0, [r2]
	cmp r0, #0
	bne _08011398
	adds r0, r1, #0
	bl Proc_End
	b _080113CA
	.align 2, 0
_08011394: .4byte gUnknown_03002B5C
_08011398:
	movs r0, #0
	strh r0, [r2]
	adds r1, #0x64
	movs r4, #0
	movs r0, #1
	strh r0, [r1]
	bl sub_08011300
	bl sub_08011354
	ldr r1, _080113D4 @ =gUnknown_03001408
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080113D8 @ =gUnknown_03002F3C
	strh r4, [r0]
	ldr r0, _080113DC @ =gUnknown_0200B274
	ldr r1, _080113E0 @ =0x04000040
	ldr r3, _080113E4 @ =0x0000A240
	ldr r2, _080113E8 @ =sub_08011228
	str r2, [sp]
	movs r2, #1
	bl sub_080111C8
_080113CA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080113D4: .4byte gUnknown_03001408
_080113D8: .4byte gUnknown_03002F3C
_080113DC: .4byte gUnknown_0200B274
_080113E0: .4byte 0x04000040
_080113E4: .4byte 0x0000A240
_080113E8: .4byte sub_08011228

