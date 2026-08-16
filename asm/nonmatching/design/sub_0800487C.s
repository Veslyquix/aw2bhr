	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800487C
sub_0800487C: @ 0x0800487C
	push {r4, lr}
	ldr r2, _080048C8 @ =gUnknown_03001470
	ldr r0, _080048CC @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	adds r0, #0x1e
	ldr r4, _080048D0 @ =gUnknown_0200B0B0
	ldr r1, [r4]
	adds r1, #0x9c
	bl sub_0808B694
	cmp r0, #0
	beq _080048AC
	ldr r2, [r4]
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080048AC:
	bl sub_08023348
	bl sub_0803662C
	bl sub_08024268
	bl sub_08024830
	bl sub_08002DEC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080048C8: .4byte gUnknown_03001470
_080048CC: .4byte gUnknown_03001FBC
_080048D0: .4byte gUnknown_0200B0B0

