	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800EB5C
sub_0800EB5C: @ 0x0800EB5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0800EBF0 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _0800EBF4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800EBF8 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #4
	bne _0800EBE6
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x25
	bl sub_0800EBFC
	adds r6, r7, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x45
	bl sub_0800EBFC
	adds r3, r7, #2
	mov r8, r3
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x65
	bl sub_0800EBFC
	adds r5, r4, #1
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x26
	bl MakeTileSimple
	adds r4, #2
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x27
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x46
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x47
	bl MakeTileSimple
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0x66
	bl MakeTileSimple
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x67
	bl MakeTileSimple
_0800EBE6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EBF0: .4byte gUnknown_08499590
_0800EBF4: .4byte 0x0000417A
_0800EBF8: .4byte 0x00001432

